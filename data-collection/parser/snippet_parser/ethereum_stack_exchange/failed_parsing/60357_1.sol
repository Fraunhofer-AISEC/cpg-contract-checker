pragma solidity ^0.4.23;

contract Adoption {

  address[16] public adopters;

  function adopt(uint petId) returns(uint) { 
    require(petId >= 0 && petId =< 15);
    adopters [pedId] = msg.sender;
    return petId;
  }

  function getAdopters(uint) public returns (address[16]) {
    return adopters;
  }
