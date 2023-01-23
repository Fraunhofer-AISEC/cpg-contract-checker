contract Admin {
  address private owner;

  function Admin() public { owner = msg.sender; }

  function getOwner() public returns (address) {
    return owner;
  }

  function transfer(address to) public {
    require(msg.sender == owner);
    owner = to;
  }
}

contract Lottery {
  string public result;

  Admin public admin = Admin(0x35d803f11e900fb6300946b525f0d08d1ffd4bed);  

  function setResult(string _result) public {
    require(msg.sender == admin.getOwner());
    result = _result;
  }
}
