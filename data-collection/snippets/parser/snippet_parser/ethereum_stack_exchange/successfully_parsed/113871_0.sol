contract BankContract {
    using SafeMath for uint256;
    string public name = "Token farm";
    
    uint256 private totalFarmSupply;    
    IERC20 public ATRAC;
    address private owner;
    
    address[] public stakers;
    mapping(address => uint256) public stakingBalance;
    mapping(address => uint256) public rewardBalance;
    mapping(address => bool) hasStaked;
    mapping(address => bool) isStaking;
    uint constant duration = 1 days;
    uint private end;
    uint private balance;
    uint private totalRewardBalance;

    event Stake(address indexed from, uint256 amount);
    event UnStake(address indexed from, uint256 amount);
    
    constructor(IERC20 _ATRAC, uint256 _totalFarmSupply) {
        ATRAC =_ATRAC;
        owner = msg.sender;
        totalFarmSupply =  _totalFarmSupply;
        end = block.timestamp + duration;
    }
    
    modifier onlyOwner {
      require(msg.sender == owner);
      _;
    }
 function withdrawReward() public onlyOwner {
    require (msg.sender==address(0) && stakers.length==0);
    for (uint256 i=0; i<=stakers.length; i++){
        totalRewardBalance += rewardBalance[stakers[i]];
    }
    uint256 leftToken = (totalFarmSupply.sub(totalRewardBalance));
    if(totalFarmSupply>0){
        ATRAC.transfer(msg.sender, leftToken);
    }
}
}