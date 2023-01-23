pragma solidity ^0.5.0;
contract simpleexample{

bytes32 public inputHash;
bytes32[] inputHashArray;

function addNewHash(bytes32 input) public {
  inputHash = input;
  inputHashArray.push(inputHash)-1;
  return;
}

function getHash() view public returns (bytes32[] memory){
  return inputHashArray;
}

function getLength() view public returns (uint) {
  return inputHashArray.length;
}

function blockTime() view public returns (uint blkTime) {
  return block.number;
}
}
