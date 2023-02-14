function getAllVotes () returns (uint[]) {
    bytes32[] returnVotes;

    for(uint i = 0; i < candidateList.length; i++) {
      returnVotes[i] = bytes32(votesReceived[candidateList[i]]);
    }

    return returnVotes;

  }
