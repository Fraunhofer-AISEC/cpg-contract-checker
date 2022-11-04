contract E {
  uint public x;

  event LogUpdate(uint newXValue);

  function set(uint _x) public returns(bool success) {
    x = _x;
    LogUpdate(x);
    return true;
  }

}
