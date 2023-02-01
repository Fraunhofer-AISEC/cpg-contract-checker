  function proxyPurchase(address _user) returns (bool success) {
    return purchase(_user, msg.value);
  }
