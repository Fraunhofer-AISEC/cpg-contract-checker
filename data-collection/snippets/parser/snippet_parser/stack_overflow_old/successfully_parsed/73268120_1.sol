contract TokenReceiver {
  address acceptedToken;
  event PurchaseMade(address from, uint tokensPaid);
    
  modifier acceptedTokenOnly () {
    require(msg.sender == address(acceptedToken), "Should be called only via the accepted token");
    _;
  }
    
  constructor(address _acceptedToken) {
    acceptedToken = _acceptedToken;
  }
    
  function onTransferReceived(
    address from,
    uint tokensPaid,
    bytes4 selector
  ) public acceptedTokenOnly {
    (bool success,) = address(this).call(abi.encodeWithSelector(selector, from, tokensPaid));
    require(success, "Function call failed");
  }

  function purchase(address from, uint tokensPaid) public acceptedTokenOnly {
    emit PurchaseMade(from, tokensPaid);
  }
}
