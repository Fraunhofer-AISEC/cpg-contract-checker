
pragma solidity ^0.8.0;

interface IA {

  function getParam() external view returns(uint);
}

contract A is IA {
  uint private param;
  constructor(uint _param) {
    param = _param;
  }

  function getParam() override public view returns(uint) {
    return param;
  }
}

contract B {

  A public instanceOfA; 
  IA public instanceOfIA; 
  address public addressOfInstanceOfA; 

  constructor(address _addressOfInstanceOfA) {
    instanceOfA = A(_addressOfInstanceOfA);
    instanceOfIA = IA(_addressOfInstanceOfA);
    addressOfInstanceOfA = _addressOfInstanceOfA;
  }
}
