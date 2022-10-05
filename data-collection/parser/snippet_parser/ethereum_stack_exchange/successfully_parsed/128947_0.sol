
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

    bool sent = token.transferFrom(subscriber, plan.merchant, plan.amount);
    require(sent, "token transfer failed");
    emit PaymentSent(
      subscriber,
      plan.merchant, 
      plan.amount, 
      planId, 
      block.timestamp
    );
    subscription.nextPayment = subscription.nextPayment + plan.frequency;
  }
