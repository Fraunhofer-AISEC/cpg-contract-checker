pragma solidity ^0.4.16;

contract ResultUtil {
  function generateResult(address _foo, bytes _data) public {
   _foo.call(_data);   
  }
}
