contract Voting {
  mapping (bytes32 => uint8) public votesReceived;
  mapping (bytes32 => bool) public candidateList;
  function Voting(bytes32[] candidateNames) {
    for(uint i = 0; i < candidateNames.length; i++) {
      candidateList[candidateNames[i]] = true;
    }
  }
  function totalVotesFor(bytes32 candidate) returns (uint8) {
    require(validCandidate(candidate) == true);
    return votesReceived[candidate];
  }
  function voteForCandidate(bytes32 candidate) {
    require(validCandidate(candidate) == true);
    votesReceived[candidate] += 1;
  }
  function validCandidate(bytes32 candidate) returns (bool) {
    return candidateList[candidate];
  }
}
