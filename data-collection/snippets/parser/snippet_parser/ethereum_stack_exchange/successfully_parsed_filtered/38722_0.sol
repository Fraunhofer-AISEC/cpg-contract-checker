pragma solidity ^0.4.13;

contract ERC20Events {
    event Approval(address indexed src, address indexed guy, uint wad);
    event Transfer(address indexed src, address indexed dst, uint wad);
}

contract ERC20 is ERC20Events {
    function totalSupply() public view returns (uint);
    function balanceOf(address guy) public view returns (uint);
    function allowance(address src, address guy) public view returns (uint);

    function approve(address guy, uint wad) public returns (bool);
    function transfer(address dst, uint wad) public returns (bool);
    function transferFrom(
        address src, address dst, uint wad
    ) public returns (bool);
}

contract TimedChest {

    
    address public withdrawer;

    
    address public owner;

    
    ERC20 public token;
    
    

    
    uint[] public releaseTimes;

    
    uint[] public amounts;

    modifier onlyAfter(uint _time) {
        require(now >= _time);
        _;
    }

    modifier onlyBy(address _account) {
        require(msg.sender == _account);
        _;
    }

    function changeOwner(address _newOwner) public onlyBy(owner) {
        owner = _newOwner;
    }

    function TimedChest(uint[] _releaseDelays, uint[] _amounts, address _withdrawer, address _tokenAddress) public {
        owner = msg.sender;

        require (address(_tokenAddress) != 0x0);
        require (address(_withdrawer) != 0x0);
        require (_releaseDelays.length == _amounts.length && _releaseDelays.length > 0);

        for (uint8 i = 0; i < _releaseDelays.length; i++) {
            require(_releaseDelays[i] > now);
            require(_amounts[i] > 0);
            if (i == 0) {
                releaseTimes[i] = now + _releaseDelays[i];
            } else {
                releaseTimes[i] = releaseTimes[i-1] + _releaseDelays[i];
            }
        }

        releaseTimes = _releaseDelays;
        amounts = _amounts;
        withdrawer = _withdrawer;

        token = ERC20(_tokenAddress);
        
        
    }

    function withdraw() onlyBy(withdrawer) external {
        uint256 amount = token.balanceOf(this);
        require (amount > 0);

        for (uint8 i = 0; i < releaseTimes.length; i++) {
            if (releaseTimes[i] < now && amounts[i] > 0) {
                token.transfer(withdrawer, amounts[i]);
            }
        }
    }

    function withdrawAll() onlyBy(owner) external {
        uint256 amount = token.balanceOf(this);
        require (amount > 0);

        token.transfer(owner, amount);
    }

}
