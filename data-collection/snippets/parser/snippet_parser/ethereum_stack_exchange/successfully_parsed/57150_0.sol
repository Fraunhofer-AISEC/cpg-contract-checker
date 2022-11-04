 pragma solidity ^0.4.24;

contract Storage {
  uint256 storedData;

  event print(uint256 store);

  function set(uint256 data) public {
    emit print(data);
    storedData = data;
  }

  function get() constant returns (uint256) {
    return storedData;   
  }
}
