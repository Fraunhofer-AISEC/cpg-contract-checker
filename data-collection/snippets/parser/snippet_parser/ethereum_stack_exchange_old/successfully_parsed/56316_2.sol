contract B {

  bool private b;

  constructor() {
    b = true
  }

  function _setB(bool newVal) internal {
    b = newVal;
  }

  function getB() public view returns(bool) { 
    return b;
  }
}

contract A is B {

  function setB(bool newVal) public onlyOwer {
    _setB(newVal);
  }

  
}
