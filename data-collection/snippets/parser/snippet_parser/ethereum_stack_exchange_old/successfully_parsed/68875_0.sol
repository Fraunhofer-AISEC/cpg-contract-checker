pragma solidity ^0.5.0;
contract Election{
  
  struct candidate
  {
    uint id;
    string name;
    uint votecount;
  }
  
  

  mapping(uint => candidate) public candidates;

  

  uint public candidatescount;

  function () Election public {
    addcandidate("candidate1");
    addcandidate("candidate2");
  }
  function addcandidate (string _name) private
  {
    candidatecount ++;
    candidates[candidatescount] = candidate(candidatescount, _name, 0);
  }
}
