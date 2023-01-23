function cancel(uint planId) external {
    Subscription storage subscription = subscriptions[msg.sender][planId];
    require(
        subscription.subscriber != address(0), 
        'this subscription does not exist'
    );
    delete subscriptions[msg.sender][planId]; 
    emit SubscriptionCancelled(msg.sender, planId, block.timestamp);
  }
