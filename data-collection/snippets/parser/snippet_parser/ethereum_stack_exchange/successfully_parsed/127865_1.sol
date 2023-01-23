    

  pragma solidity ^0.8.0;

  import "usingtellor/contracts/UsingTellor.sol";

  contract PriceContract is UsingTellor {

  uint256 public maticPrice;
  uint256 public cost = 20 ether;

  uint256 public monthlyPayment;

  
  constructor(address payable _tellorAddress) UsingTellor(_tellorAddress) public {}


struct Subscription {
        address payable subscriber;
        uint start;
        uint nextPayment;
        bool activated;
    }

    
     
    mapping(address => mapping(uint => Subscription)) private AllSubscriptions;


    function pay(uint256 planId) 
        external payable
        onlyUsers()
        {
        Subscription storage submitSubscription = AllSubscriptions[msg.sender][planId];

        require(block.timestamp > submitSubscription.nextPayment, " Payment not due yet");
        Plan storage plan = idToPlan[planId];

        
        require(msg.value >= monthlyPayment, "Monthly payment not correct");

        emit PaymentSent(
            payable(msg.sender),
            payable(address(this)),
            plan.monthlyPayment,
            planId,
            block.timestamp);
        totalPaymentsPerWallet[msg.sender] += 1; 
        submitSubscription.nextPayment = submitSubscription.nextPayment + 4 weeks;

    }


 function setMaticPrice() public {

    bytes memory _b = abi.encode("SpotPrice",abi.encode("matic","usd"));
    bytes32 _queryID = keccak256(_b);

    bool _didGet;
    uint256 _timestamp;
    bytes memory _value;

    (_didGet, _value, _timestamp) = getDataBefore(_queryID, block.timestamp - 5 minutes);

    maticPrice = abi.decode(_value,(uint256));

    uint256 price = (cost/maticPrice);

    monthlyPayment = price * 10 **18;

  }


}
