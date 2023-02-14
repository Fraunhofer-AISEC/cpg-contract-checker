pragma solidity ^0.4.18; 


contract Test {

uint32[100] public people;
uint256 public counter; 
mapping(uint32 => bool) public voteVerifier; 


function onlyOneVote(uint32 ida) public returns(bool) {
  require(!voteVerifier[ida]); 

    people[counter] = ida; 
    counter = counter + 1;

    voteVerifier[ida] = true;
  return true;
}

}
