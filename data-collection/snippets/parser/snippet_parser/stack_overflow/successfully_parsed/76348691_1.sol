
pragma solidity ^0.8.17;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    string public name = "MKrushna";
    string public symbol = "MK";
    uint8 public decimals = 18;
    

    

    mapping (address=>uint) public stackedBalance;
    mapping (address =>uint) public stakeStartTime;
    uint public  stakingDuration  = 1 weeks;
    uint public rewardRate = 10;

    event Staked(address indexed user, uint amount);
    event Unstaked(address indexed user, uint amount);

    function getName() external view returns (string memory) {
  return name;
}
    function getSymbol() external view returns (string memory) {
  return symbol;
}
    function getBalance(address _user) external view returns (uint256) {
  return balanceOf[_user];
}

    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    

function stake(uint amount) external  {
    require(amount>0 , "amount should be greater than zero");
    require(balanceOf[msg.sender] >=0, "not sufficient balance");

    balanceOf[msg.sender] -= amount;
    balanceOf[address(this)]+= amount;

    stackedBalance[msg.sender] += amount;
    stakeStartTime[msg.sender] = block.timestamp;

    emit Staked(msg.sender , amount);

}

function unstake(uint amount) external {
    require(amount >0 , "Amount is must br greater >0");
    require(stackedBalance[msg.sender] >=amount, "not enough staked balance");


    uint reward = calculateReward(msg.sender);

    stackedBalance[msg.sender] -= amount;
    stakeStartTime[msg.sender] = 0;

    balanceOf[address(this)] -= amount;
    balanceOf[msg.sender] += amount+ reward;

    emit Unstaked(msg.sender, amount);


}
   function calculateReward(address user) internal view  returns (uint){
       if(stakeStartTime[user] ==0){
           return 0;
       }

       uint stakingTime = block.timestamp-stakeStartTime[user];

       uint reward = (stackedBalance[user] *rewardRate * stakingTime) /(stakingDuration * 100);
        return reward;
   }
}
