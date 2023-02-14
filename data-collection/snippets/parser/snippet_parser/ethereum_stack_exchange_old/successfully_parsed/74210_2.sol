pragma solidity ^0.5.0;
contract simpleexample{
    bytes32[] inputHashArray;

    function addNewHash(bytes32 input) public returns (uint) {
      inputHashArray.push(input);
      return inputHashArray.length-1;
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
