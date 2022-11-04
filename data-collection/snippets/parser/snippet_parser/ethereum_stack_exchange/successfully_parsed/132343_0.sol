contract Demo {
  mapping(address => bool) public received;
    
  function receiveOnce() public payable {
    require(!received[msg.sender], "You can only send once");
    received[msg.sender] = true;
  }
}
