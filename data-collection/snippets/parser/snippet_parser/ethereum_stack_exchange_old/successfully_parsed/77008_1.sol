contract Storage {
  address private owner;
  bytes32 private hash;

  constructor () public {
    owner = msg.sender; 
  }

  function set (bytes32 _hash) public {
    require (msg.sender == owner); 
    hash = _hash;
  }

  function get () public view returns (bytes32) {
    return hash;
  }
}
