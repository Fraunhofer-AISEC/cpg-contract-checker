 pragma solidity ^0.5.0;
 contract StoreVar {
   bytes32 public _myVar;
   function setVar(bytes32 _var) public {
     _myVar = _var;
   }
   function getVar() public view returns (bytes32) {
     return _myVar;
   }
}
