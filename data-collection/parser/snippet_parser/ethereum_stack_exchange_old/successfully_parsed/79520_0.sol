function readCustomerBalance() public view returns (uint) {
  return msg.sender.balance;
}
