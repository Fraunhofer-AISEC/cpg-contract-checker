function createTicket(bytes32 _name, uint _cost) public payable returns(address ticket) {
    var setBalance = _cost * 2;
    var ticketAddress = accounts[msg.sender].createTicket.value(setBalance)(_name, _cost);
    return ticketAddress;
  }
