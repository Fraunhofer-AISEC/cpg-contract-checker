contract logicContract {
  address immutable myProxy;
  
  constructor(address _myProxy) {
    myProxy = _myProxy;
  }

  protectedFunction() {
    require(address(this) == myProxy);
  }
}
