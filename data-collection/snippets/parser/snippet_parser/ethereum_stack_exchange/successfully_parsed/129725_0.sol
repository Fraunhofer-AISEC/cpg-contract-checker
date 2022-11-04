pragma solidity ^0.8.0;

contract Family{
mapping(address => uint) public familyMembers;


function getAllMembers() public pure returns (address[] memory){
  uint addressRegistryCount = 0;  
  address[] memory members= new address[](addressRegistryCount);
  for (uint i = 0; i < addressRegistryCount; i++) {
     members[i] = familyMembers[i];
  }
  return members;
}
}