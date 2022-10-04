function pledge(bytes32 _message) {
  if (msg.value == 0 || complete || refunded) throw;
  pledges[numPledges] = Pledge(msg.value, msg.sender, _message);
  numPledges++;
}

struct Pledge {
  uint amount;
  address eth_address;
  bytes32 message;
}
