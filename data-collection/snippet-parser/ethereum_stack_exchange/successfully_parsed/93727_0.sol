mapping(bytes32 => unit) public pendingPayments;

function beAHero(address receiver, bytes32 secret) public {
  bytes32 key = keccak256(abi.encodePacked(receiver, secret));
  uint amount = pendingPayments[key];
  if(amount > 0) {
    pendingPayments[key] = 0;
    receiver.transfer(amount);
    
  }
}
