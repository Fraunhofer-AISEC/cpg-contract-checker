pragma solidity ^0.4.0;


contract Voting {


  mapping (bytes32 => uint8) public votesReceived;



  bytes32[] public candidateList;
string myString = "someString";



  function Voting(bytes32[] candidateNames) public {
    candidateList = candidateNames ;

  }


  function totalVotesFor(bytes32 candidate) view public returns (uint8) {
    return votesReceived[candidate];
  }

  function addCandidate(bytes32 candidate)  public returns (bool){
    require(isNewEntry(candidate));
    candidateList.push(candidate);
    return isNewEntry(candidate);
  }

  function voteForCandidate(bytes32 candidate) public {
    require(validCandidate(candidate));
    votesReceived[candidate] += 1;
  }

  function getCandidateList() view public returns (bytes32[]) {
return candidateList;
  }

  function isNewEntry(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
        if (candidateList[i] == candidate) {
            return false;
        }
    }
    return true;
  }

  function validCandidate(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}
