
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

        require(block.timestamp > submitSubscription.nextPayment, " Payement not due yet");
        Plan storage plan = idToPlan[planId];

        require(msg.value >= plan.monthlyPayment, " Monthly payment not correct");

        emit PaymentSent(
            payable(msg.sender),
            payable(address(this)),
            plan.monthlyPayment,
            planId,
            block.timestamp);
        totalPaymentsPerWallet[msg.sender] += 1; 
        submitSubscription.nextPayment = submitSubscription.nextPayment + 4 weeks;

    }



  pragma solidity ^0.8.0;

  import "usingtellor/contracts/UsingTellor.sol";

  contract PriceContract is UsingTellor {

  uint256 public btcPrice;

  

  constructor(address payable _tellorAddress) UsingTellor(_tellorAddress) public {}

  function setBtcPrice() public {

    bytes memory _b = abi.encode("SpotPrice",abi.encode("MATIC","USD"));
    bytes32 _queryID = keccak256(_b);

    bool _didGet;
    uint256 _timestamp;
    bytes _value;

    (_didGet, _value, _timestamp) = getDataBefore(_queryID);

    uint256 maticPrice = abi.decode(_value,(uint256));

    require(token.transferFrom(subscriber,address(this),cost/maticPrice));
  }
}
