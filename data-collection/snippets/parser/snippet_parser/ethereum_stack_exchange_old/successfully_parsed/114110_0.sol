pragma solidity ^0.8.2;
contract Test{
  bool public myVar = false;
  function setBool(bool setVarBool) public
  {
    myVar = setVarBool;
  }
}
