
struct Subscription {
        address payable subscriber;
        uint start;
        uint nextPayment;
        bool activated;
    }

    
     
    mapping(address => mapping(uint => Subscription)) private AllSubscriptions;


 function pay(address subscriber, uint planId) external {
    Subscription storage subscription = subscriptions[subscriber][planId];
    Plan storage plan = plans[planId];
    IERC20 token = IERC20(plan.token);
    require(
      subscription.subscriber != address(0), 
      'this subscription does not exist'
    );
    require(
      block.timestamp > subscription.nextPayment,
      'not due yet'
    );

    token.transferFrom(subscriber, plan.merchant, plan.amount);  
    emit PaymentSent(
      subscriber,
      plan.merchant, 
      plan.amount, 
      planId, 
      block.timestamp
    );
    subscription.nextPayment = subscription.nextPayment + plan.frequency;
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
