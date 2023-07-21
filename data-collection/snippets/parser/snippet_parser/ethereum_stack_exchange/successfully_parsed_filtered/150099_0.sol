
pragma solidity ^0.8.9;

interface Token
{
    function transfer(address _To, uint256 _Amount) external returns (bool);
    function balanceOf(address account) external view returns(uint);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function mint(address to, uint256 amount) external returns(bool);
}

contract Staking
{
    Token ELONToken;

    
    uint256 public StakeDuration = 1;

    
    uint8 IntrestRate = 10;

    uint256 TotalStakers;

    
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

    
    function CheckBalance(address account) external view returns(uint256)
    {
        return(ELONToken.balanceOf(account));
    }

    
    function MintTokens(address To, uint256 _amount) public returns(bool)
    {
        ELONToken.mint(To, _amount);
        return(true);
    }
    
    
    function StakeTokens(uint256 _Stakeamount) external payable
    {
        require(_Stakeamount > 0, "Stake amount cannot be Zero");
        require(StakedAddress[msg.sender] == false,"You have already Staked");
        require(ELONToken.balanceOf(msg.sender) >= _Stakeamount, "Insufficient Tokens");
       
        ELONToken.transferFrom(msg.sender, address(this), _Stakeamount);
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
        
        uint256 Mintamount = ClaimAmount*IntrestRate/100;
        uint256 totalReward = ClaimAmount + Mintamount; 
        
        StakerInfos[msg.sender].claimed += totalReward;

        ELONToken.transfer(msg.sender, totalReward);
        
        return true;
    }
}
