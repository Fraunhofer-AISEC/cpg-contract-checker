struct Plan {
    address merchant;
    address token;
    uint amount;
    uint frequency;
}

struct Subscription {
    address subscriber;
    uint start;
    uint lastPayment;
}

mapping(uint => Plan) public plans;
mapping(address => mapping(uint => Subscription)) public subscriptions;

uint feeIncrement = 10**16;

function pay(address subscriber, uint planId) payable external {
    Subscription storage subscription = subscriptions[subscriber][planId];
    Plan storage plan = plans[planId];

    require(subscription.subscriber != address(0), "This subscription doesn't exist.");

    
    require(subscription.lastPayment + plan.frequency >= block.timestamp, "Payment is not due.");

    
    
    uint duePayments = ((block.timestamp - subscription.lastPayment) / plan.frequency);

    
    
    require(msg.value >= (((plan.monthlyPayment + feeIncrement) * duePayments) - feeIncrement), "Payment value is incorrect.");
 
    emit PaymentSent(
      subscriber,
      plan.merchant, 
      plan.amount, 
      planId, 
      block.timestamp
    );

    
    
    subscription.lastPayment += (plan.frequency * duePayments);
}
