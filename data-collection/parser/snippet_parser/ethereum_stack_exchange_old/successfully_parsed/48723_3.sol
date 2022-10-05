contract ExampleContract {
  event ReturnValue(address indexed _from, int256 _value);

function foo(int256 _value) returns (int256) {
    ReturnValue(msg.sender, _value);
    return _value;
  }
}
