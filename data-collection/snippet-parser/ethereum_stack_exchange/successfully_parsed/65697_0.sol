contract SimpleStore {
  uint public value;
  address public addr;

  function set(address[] _addr , uint[] _value) public {
    value = _value[0];
    addr = _addr[0];
  }
  function get() public constant returns (uint) {
    return value;
  }
}
