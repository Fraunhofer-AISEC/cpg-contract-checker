pragma solidity ^0.5.0;

contract SimpleStorage {
string storedData;


function set(string x) public {
   storedData = x;
  }

  function get() public view returns (string) {
    return storedData;
  }
}
