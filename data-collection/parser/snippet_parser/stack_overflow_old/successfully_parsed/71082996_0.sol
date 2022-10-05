contract Flipper {
  bool private value;

  constructor (bool initValue) {
    value = initValue;
  }

  function flip () public {
    value = !value;
  }

  function get () public view returns (bool) {
    return value;
  }

}
