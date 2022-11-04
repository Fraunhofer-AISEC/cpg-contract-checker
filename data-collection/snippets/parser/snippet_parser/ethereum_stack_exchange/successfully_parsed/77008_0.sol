pragma solidity ^0.5.0;

contract Storage {
  string Hash;

  function set(string memory x) public {
    Hash = x;
  }

  function get() public view returns (string memory) {
    return Hash;
  }
}
