function getUnfinishedMatches() public constant returns (uint256[]) {
  uint256[] memory unFinishedMatches = new uint[](getMatchCount());

  for (uint i = 0; i <= matchInfo.length; i++) {
    if (matchInfo.isMatchdone == false) {
      unFinishedMatches[i] = matchInfo.matchId;
    }
  }

  return unFinishedMatches;
}
