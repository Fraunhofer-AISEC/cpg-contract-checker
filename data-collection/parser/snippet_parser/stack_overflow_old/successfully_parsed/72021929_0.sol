 struct Plan {
        address merchant;
        address token;
        uint amount;
        uint frequency;
      }
      struct Subscription {
        address subscriber;
        uint start;
        uint nextPayment;
      }
      mapping(uint => Plan) public plans;
      mapping(address => mapping(uint => Subscription)) public subscriptions;
    
    function pay(address subscriber, uint planId) external {
        Subscription storage subscription = subscriptions[subscriber][planId];
        Plan storage plan = plans[planId];
        require(
          subscription.subscriber != address(0), 
          'this subscription does not exist'
        );
        require(
          block.timestamp > subscription.nextPayment,
          'not due yet'
        );
   require(msg.value >= plan.monthlyPayment, "monthly payment not correct");
     
        emit PaymentSent(
          subscriber,
          plan.merchant, 
          plan.amount, 
          planId, 
          block.timestamp
        );
        subscription.nextPayment = subscription.nextPayment + 4 weeks;
      }
