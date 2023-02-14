
pragma solidity 0.8.0;

contract Parent {
  string _test = "Empty";

  constructor(bool checkInit) {
    if(checkInit)
        init();
  }

  function init() internal {
      _test = "Hello World / Father";
  }
  
}

contract Child is Parent {
  constructor() Parent(true) {
    
  }

  function getName() external view returns(string memory) {
      return _test;
  }
}
