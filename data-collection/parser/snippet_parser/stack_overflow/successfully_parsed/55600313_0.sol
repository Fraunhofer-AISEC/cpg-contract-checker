function send() public payable {
  require(msg.sender.balance >= msg.value);
}
