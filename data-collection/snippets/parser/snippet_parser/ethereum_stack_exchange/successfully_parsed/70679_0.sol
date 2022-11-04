pragma solidity ^0.4.26;

contract TestShaAlgo {
  function getSha256(string str) public view returns (bytes32) {
  bytes32 hash = sha256(abi.encodePacked(str));
  return hash;
  }
}
