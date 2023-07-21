pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

interface Token
{
    function transfer(address _To, uint256 _Amount) external returns (bool);
    function CheckBalance(address account) external view returns(uint);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function mint(address account, uint256 amount) external returns(bool);
}

contract Staking is Ownable
{
    Token ELONToken;

    
    uint256 public StakeDuration = 1;

    
    uint8 IntrestRate = 10;

    uint256 TotalStakers;
    bool public _pause = false;
    bool lock;

    
    struct StakerInfo
    {
        uint256 startTS;
        uint256 endTS;
        uint256 amount;
        uint256 claimed;
    }

    
    mapping(address => StakerInfo) public StakerInfos;

    
    mapping(address => bool) public StakedAddress;

    constructor(Token ERC20_add)
    {
        require(address(ERC20_add)!= address(0),"Enter Valid Contract address");
        ELONToken = ERC20_add;
        TotalStakers = 0;
    }

    modifier whenNotPaused
    {
        require(_pause == false, "Contract has been paused by the owner");
        _;
    }

    
    function CheckExpieryDate() external view returns(uint256)
    {
        require(StakedAddress[msg.sender]==true,"You have not staked any tokens");
        return(StakerInfos[msg.sender].endTS);
    }

    
    function Pause() external onlyOwner returns(bool) 
    {
        _pause = true;
        return(_pause);
    }

    
    function CheckBalance(address account) external view returns(uint)
    {
        return(ELONToken.CheckBalance(account));
    }
    
    function MintTokens(uint256 Mintamount) internal
    {
        ELONToken.mint(address(this),Mintamount);
    }
    
    
    function StakeTokens(uint256 _Stakeamount) external payable whenNotPaused
    {
        require(_Stakeamount > 0, "Stake amount cannot be Zero");
        require(StakedAddress[msg.sender] == false,"You have already Staked");
        require(ELONToken.CheckBalance(msg.sender) >= _Stakeamount, "Insufficient Tokens");
        require(lock == false,"Aborting Transfer is locked");
        lock = true;
        ELONToken.transferFrom(msg.sender, address(this), _Stakeamount);
        lock = false;
        unchecked
        {
            ++TotalStakers;
        }
        StakedAddress[msg.sender] = true;
        StakerInfos[msg.sender] = StakerInfo({
            startTS: block.timestamp,
            endTS: block.timestamp + StakeDuration,
            amount: _Stakeamount,
            claimed: 0
        });
    }

    function ClaimRewards(uint256 ClaimAmount) external returns (bool)
    {
        require(StakedAddress[msg.sender] == true,"You have not Staked any Tokens");
        require(StakerInfos[msg.sender].endTS < block.timestamp, "Stake Time is not over yet");
        require(ClaimAmount <= StakerInfos[msg.sender].amount,"Not enough Tokens to Claim");
        require(lock == false,"Aborting!!! Transfer is locked");
        uint256 Mintamount = ClaimAmount*IntrestRate/100;
        uint256 totalReward = ClaimAmount + Mintamount; 
        MintTokens(Mintamount);
        StakerInfos[msg.sender].claimed += totalReward;
        lock = true;
        ELONToken.transfer(msg.sender, totalReward);
        lock = false;
        return true;
    }
}
