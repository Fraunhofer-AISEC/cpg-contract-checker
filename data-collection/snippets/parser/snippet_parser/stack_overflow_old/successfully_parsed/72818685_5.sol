function onTransferReceived(address operator, address sender, uint256 tokensPaid, bytes calldata data) external override (IERC1363Receiver) returns (bytes4) {
    require(msg.sender == address(acceptedToken), "I accept purchases in Payable Tokens");
​
    (bytes4 selector, uint productAmount, bytes3 color) =
        decode(data);
​
    if (selector == this.buy.selector) {
      buy(sender, tokensPaid, productAmount, color);
    }
​
    return this.onTransferReceived.selector;
  }
