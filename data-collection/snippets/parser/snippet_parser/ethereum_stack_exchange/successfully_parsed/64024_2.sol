contract ParserDemo {
  uint public min;
  address public who;
  string public message;
  event Parsed(uint _min, address _who, string _message);
  event Data(bytes _message);
  function test(bytes data) public {
    address a = this;
    assembly {
      if iszero(delegatecall(gas, a, add(data, 32), mload(data), 0, 0)) {
          revert(0, 0)
      }
    }
  }
  function parser(uint _min, address _who, string _message) public {
    min = _min;
    who = _who;
    message = _message;
    emit Parsed(_min, _who, _message);
  }

}
