contract C {
  modifier restrictTargetType(address target, uint contractType) {
    require(contractTypes[target] == contractType);
    _;
  }
  function f(address target, uint contractType) restrictTargetType(target, contractType) {
    ....
  }
}
