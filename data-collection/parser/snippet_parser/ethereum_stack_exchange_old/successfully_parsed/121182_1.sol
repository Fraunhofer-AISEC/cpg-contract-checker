pragma solidity ^0.8.0;

contract cool {
  
  uint[] public data;
  
   function set(uint _data) public {
     data.push(_data);
   }
  function see() public view returns(uint[] memory) {
      return data;
  }
}
