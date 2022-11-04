function sendEtherTo(address addr) public payable {
   require(addr != 0x0);
   require(msg.value > 0);
   addr.transfer(msg.value);
}
