





function requestSubscription(uint _usdEthBasis)
    whenNotPaused
    payable
    returns (bool success)
  {
    var (_ethPendingSubscription, _totalEthPendingSubscription) = 
    investorActions.requestSubscription(msg.sender, msg.value);
    investors[msg.sender].ethPendingSubscription = _ethPendingSubscription;
    totalEthPendingSubscription = _totalEthPendingSubscription;

    LogSubscriptionRequest(msg.sender, msg.value, _usdEthBasis);
    return true;
  }
