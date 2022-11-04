contract TokenReceiver is IERC1363Receiver {
  IERC1363 acceptedToken;
    
  constructor(IERC1363 _acceptedToken) {
    acceptedToken = _acceptedToken;
  }
  event PurchaseMade(address indexed sender, uint tokensPaid, uint productAmount, bytes3 color);
    
  function buy(address sender, uint tokensPaid, uint productAmount, bytes3 color) public {
    
    require(msg.sender == address(acceptedToken), "I accept purchases in Payable Tokens");
    emit PurchaseMade(sender, tokensPaid, productAmount, color);
  }

  function onTransferReceived(address operator, address sender, uint256 tokensPaid, bytes calldata data) external override (IERC1363Receiver) returns (bytes4) {
      
    return this.onTransferReceived.selector;
  }
}
