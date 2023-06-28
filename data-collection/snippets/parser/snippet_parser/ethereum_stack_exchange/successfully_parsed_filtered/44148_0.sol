pragma solidity ^0.4.16;




contract Owned {
  address public owner;



  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
  event TokenOwnershipTransferred(address indexed _newOwner, address indexed _previousOwner);


  
  function Owned() public {
    owner = msg.sender;
  }

  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
}


    function transferTokenOwnership(address _newOwner) public onlyOwner {
    require(_newOwner != address(0));
     emit TokenOwnershipTransferred(owner, _newOwner);
     owner = _newOwner;

}
}

interface token {
    function mint(address receiver, uint amount) external;

}


library SafeMath {

  
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    
    uint256 c = a / b;
    
    return c;
  }

  
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract FCCCrowdsale is Owned{
    using SafeMath for uint256;

    address public beneficiary;
    uint256 public fundingGoal;
    uint256 public amountRaised;
    uint256 public openingTime;
    uint256 public closingTime;
    uint256 public initialRate;
    uint256 public finalRate;
    token public tokenReward;


    mapping(address => uint256) public balanceOf;

    bool fundingGoalReached = false;
    bool crowdsaleClosed = false;

    event GoalReached(address recipient, uint totalAmountRaised);
    event FundTransfer(address backer, uint amount, bool isContribution);

      event Closed();
}