contract Thing {

  address payable owner;

  function forwarder() public payable {
    owner.transfer(msg.value);
  }
}
