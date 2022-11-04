function sendEther(string data) payable {
  address sender = msg.sender;
  uint value = msg.value;
  voter[sender].data = data;
  voter[sender].amount = value;
  voterIndex[voter_count] = sender;
  voter_count = voter_count + 1;
  Deposit(sender, value);
}
