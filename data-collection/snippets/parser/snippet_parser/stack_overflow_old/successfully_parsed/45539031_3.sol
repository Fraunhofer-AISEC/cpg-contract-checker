pragma solidity ^0.4.11;


contract Voting {
  

  mapping (bytes32 => uint8) public votesReceived;
  mapping (bytes32 => bool) public validCandidates;

  
  function Voting(bytes32[] candidateList) {
    for (uint i = 0; i < candidateList.length; i++) {
      validCandidates[candidateList[i]] = true;
    }
  }

  
  function totalVotesFor(bytes32 candidate) constant returns (uint8) {
    return votesReceived[candidate];
  }

  
  
  function voteForCandidate(bytes32 candidate) onlyForValidCandidate(candidate) {
    votesReceived[candidate] += 1;
  }

  function isValidCandidate(bytes32 candidate) constant returns (bool)  {
    return validCandidates[candidate];
  }

  modifier onlyForValidCandidate(bytes32 candidate) {
    require(isValidCandidate(candidate));
    _;
  }
}
