pragma solidity ^0.5.16;

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
 }

contract Staking {
    using SafeMath for uint;

    event StartStaking(address addr, uint value, uint amount, uint time);
    event WithdrawStake(address staker, uint amount);
    event Claim(address staker, uint reward);
    event DonationDeposited(address _address, uint value);

    struct Staker
    {
        uint amount;
        uint time;
    }


    uint public LastBlock = block.number;
    uint public Timestamp = now;

    uint public TotalStakingWeight;
    uint public TotalStakingAmount;
    uint public StakingRewardPool;
    bool public CS_frozen;
    uint public staking_threshold = 0 ether;
    address payable public Treasury = 0xD0eDff4E0b7e7e410F631669B040905267E9FFD1;

    uint public round_interval   = 27 days;
    uint public max_delay        = 365 * 2 days;
    uint public DateStartStaking = 1541980800;

    mapping(address => Staker) public staker;

    function freeze(bool _f) public only_treasurer
    {
        CS_frozen = _f;
    }

    function withdraw_rewards () public only_treasurer
    {
        if (CS_frozen)
        {
            StakingRewardPool = address(this).balance.sub(TotalStakingAmount);
            address(Treasury).transfer(StakingRewardPool);
        }
    }

    function clear_treasurer () public only_treasurer
    {
        require(block.number > 1800000 && !CS_frozen);
        Treasury = address(0);
    }

    function() external payable
    {
        start_staking();
    }

    function new_block() public payable
    {
        if (block.number > LastBlock)
        {
            uint _LastBlock = LastBlock;
            LastBlock = block.number;

            StakingRewardPool = address(this).balance.sub(TotalStakingAmount + msg.value);

            if (now > Timestamp)
            {
                uint _blocks = block.number - _LastBlock;
                uint _seconds = now - Timestamp;
                if (_seconds > _blocks * 25)
                {
                    _seconds = _blocks * 25;
                }
                TotalStakingWeight += _seconds.mul(TotalStakingAmount);
                Timestamp += _seconds;
            }
        }
    }

    function start_staking() public staking_available payable
    {
        assert(msg.value >= staking_threshold);
        new_block();

        if (staker[msg.sender].amount > 0)
        {
            if (Timestamp >= staker[msg.sender].time + round_interval)
            { 
                claim(); 
            }
            TotalStakingWeight = TotalStakingWeight.sub((Timestamp.sub(staker[msg.sender].time)).mul(staker[msg.sender].amount));
        }

        TotalStakingAmount = TotalStakingAmount.add(msg.value);
        staker[msg.sender].time = Timestamp;
        staker[msg.sender].amount = staker[msg.sender].amount.add(msg.value);

        emit StartStaking(
            msg.sender,
            msg.value,
            staker[msg.sender].amount,
            staker[msg.sender].time
        );
    }

    function DEBUG_donation() public payable {
        emit DonationDeposited(msg.sender, msg.value);
    }

    function withdraw_stake() public only_staker
    {
        new_block();
        require(Timestamp >= staker[msg.sender].time + round_interval);

        uint _amount = staker[msg.sender].amount;
        claim(); 
        TotalStakingAmount = TotalStakingAmount.sub(_amount);
        TotalStakingWeight = TotalStakingWeight.sub((Timestamp.sub(staker[msg.sender].time)).mul(staker[msg.sender].amount));

        staker[msg.sender].amount = 0;
        msg.sender.transfer(_amount);
        emit WithdrawStake(msg.sender, _amount);
    }

    function claim() public only_staker
    {
        if (CS_frozen) return;

        new_block();
        uint _StakingInterval = Timestamp.sub(staker[msg.sender].time);
        if (_StakingInterval >= round_interval)
        {
            uint _CompleteRoundsInterval = (_StakingInterval / round_interval).mul(round_interval);
            uint _StakerWeight = _CompleteRoundsInterval.mul(staker[msg.sender].amount);
            uint _reward = StakingRewardPool.mul(_StakerWeight).div(TotalStakingWeight);

            StakingRewardPool = StakingRewardPool.sub(_reward);
            TotalStakingWeight = TotalStakingWeight.sub(_StakerWeight);

            staker[msg.sender].time = staker[msg.sender].time.add(_CompleteRoundsInterval);

            msg.sender.transfer(_reward);
            emit Claim(msg.sender, _reward);
        }
    }

    function stake_reward(address _addr) public view returns (uint)
    {
        require(staker[_addr].amount > 0);
        require(!CS_frozen);

        uint _blocks = block.number - LastBlock;
        uint _seconds = now - Timestamp;
        if (_seconds > _blocks * 25)
        {
            _seconds = _blocks * 25;
        }
        uint _Timestamp = Timestamp + _seconds;
        uint _TotalStakingWeight = TotalStakingWeight + _seconds.mul(TotalStakingAmount);
        uint _StakingInterval = _Timestamp.sub(staker[_addr].time);

        uint _CompleteRoundsInterval = (_StakingInterval / round_interval).mul(round_interval);
        uint _StakerWeight = _CompleteRoundsInterval.mul(staker[_addr].amount);
        uint _StakingRewardPool = address(this).balance.sub(TotalStakingAmount);
        return _StakingRewardPool.mul(_StakerWeight).div(_TotalStakingWeight);
    }

    modifier only_staker
    {
        require(staker[msg.sender].amount > 0);
        _;
    }

    modifier staking_available
    {
        require(now >= DateStartStaking && !CS_frozen);
        _;
    }

    modifier only_treasurer
    {
        require(msg.sender == Treasury);
        _;
    }

    function report_abuse(address payable _addr) public only_staker
    {
        require(staker[_addr].amount > 0);
        new_block();
        require(Timestamp > staker[_addr].time.add(max_delay));

        uint _amount = staker[_addr].amount;

        TotalStakingAmount = TotalStakingAmount.sub(_amount);
        TotalStakingWeight = TotalStakingWeight.sub((Timestamp.sub(staker[_addr].time)).mul(_amount));

        staker[_addr].amount = 0;
        address(_addr).transfer(_amount);
    }
}
