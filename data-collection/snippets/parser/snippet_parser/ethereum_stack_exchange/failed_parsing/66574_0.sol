modifier onlyServer {
  require(msg.sender == serverAddress);
  _;
}

function receive(address payable receiver, uint amount) public onlyServer {
  receiver.transfer(amount); 
  emit ...
}
