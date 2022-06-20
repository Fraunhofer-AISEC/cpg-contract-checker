function subscribe(uint planId) external {
    Plan storage plan = plans[planId];
    require(plan.merchant != address(0), 'address not valid');

    bool sent = payable(address(this)).send(plan.amount);
        require(sent, "tx failed");
 
    emit PaymentSent(
      msg.sender, 
      plan.merchant,
      plan.amount, 
      planId, 
      block.timestamp
    );


    subscriptions[msg.sender][planId] = Subscription(
      msg.sender,
      block.timestamp, 
      block.timestamp + 4 weeks 
    );
    emit SubscriptionCreated(msg.sender, planId, block.timestamp);
  } 
