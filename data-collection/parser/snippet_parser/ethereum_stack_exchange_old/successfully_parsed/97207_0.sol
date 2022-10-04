pragma solidity ^0.5.0;

contract Adoption {
 address[16] adopters;


function adopt(uint petId) public returns (uint){
  require(petId >= 0 && petId <= 15);
  adopters[petId] = msg.sender;
  return petId;
}


function getAdopters() public view returns (address[16]){
 return adopters;


 }
 }
