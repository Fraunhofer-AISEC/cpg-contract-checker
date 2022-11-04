pragma solidity ^0.4.25;

contract Voting {
  mapping (int => uint8) public votesReceived;
  int[5] candidateList = [int(0),1,2,3,4];
  uint[] votes;

  function totalVotesFor(int candidate) view public returns (uint8) {
    require(validCandidate(candidate));
    return votesReceived[candidate];
  }

  function voteForCandidate(int candidate) public {
    require(validCandidate(candidate));
    votesReceived[candidate] += 1;
  }

  function validCandidate(int candidate) view public returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        votes.push(votesReceived[candidate]);
        return true;
      }
    }
    return false;
  }
}
