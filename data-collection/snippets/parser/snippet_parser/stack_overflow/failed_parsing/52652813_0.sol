pragma solidity ^0.4.18;

 contract ApprovalContract {

  function random() external view returns (uint8){
  return uint8(uint256(keccak256(abi.encodePacked(block.timestamp, 
  block.difficulty)))%251);
  } 
 ...
 }
