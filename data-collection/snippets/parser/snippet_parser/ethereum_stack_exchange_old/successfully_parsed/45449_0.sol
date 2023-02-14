pragma solidity ^0.4.11;


contract VotingDapp {

  mapping (bytes32 => uint8) public votesReceived;

  bytes32[] public candidateList;

  function VotingDapp(bytes32[] candidateNames) public {
    
    candidateList = candidateNames;
  }

  function totalVotesFor(bytes32 candidate) public view returns (uint8) {
    if(validCandidate(candidate) == false) revert();
    return votesReceived[candidate];
  }

  function voteForCandidate(bytes32 candidate) public {
    if(validCandidate(candidate) == false) revert();
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) public view returns (bool) {
    for(uint i = 0; i < candidateList.length; i++){
      if(candidateList[i] == candidate){
        return true;
      }
    }
    return false;
  }

  function totalVotesReceived() external view returns(uint){
      uint sum = 0;
      for(uint i = 0; i < candidateList.length; i++){
          sum += votesReceived[candidateList[i]];
      }
      return sum;
  }

}
