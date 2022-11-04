mapping(uint16 => bool) matchBettingActive;
...
function beginVotingPeriodForMatch(uint16 _match)  public onlyOwner returns(bool) {
    matchBettingActive[_match] = true;
    return true;
}
function closeVotingForMatch(uint16 _match) public onlyOwner returns (bool) {
    
    matchBettingActive[_match] = false;
    return true;
}
