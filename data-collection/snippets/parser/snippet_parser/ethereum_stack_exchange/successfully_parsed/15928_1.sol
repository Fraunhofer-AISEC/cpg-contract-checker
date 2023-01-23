contract TestInterface {
  function reentrance(address dest);
}

contract Test is TestInterface {
  uint8 private _depth = 0;

  
  function () payable {}

  event Entered(uint8 depth);

  function reentrance(address dest) {
    if (_depth > 2) {
      
      throw;
    }
    Entered(_depth);
    _depth++;
    dest.transfer(this.balance);
  }
}

contract Destination {
  function () payable {
    TestInterface sender = TestInterface(msg.sender);
    
    msg.sender.send(this.balance);
    sender.reentrance(this);
  }
}






