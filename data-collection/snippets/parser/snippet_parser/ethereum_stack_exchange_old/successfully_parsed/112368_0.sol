
pragma solidity ^0.8.0;


contract parent {
  
  uint256 internal id = 9;
  
  function setValue(uint256 _value) public{
      id = _value;
  } 
  
  function getValue1() public view returns (uint256) {
    return id;
  }
}

contract child is parent {
  
   function getValue2() public view returns (uint256) {
        return id;
   }
}
