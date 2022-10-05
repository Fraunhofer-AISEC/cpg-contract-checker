pragma solidity ^0.4.19;

contract test {

  mapping (bytes4 => int[100000000000]) internal map;

  function _increase(bytes4 _id,uint _index) public {        
    map[_id][_index] = map[_id][_index] + 1;
  }

}
