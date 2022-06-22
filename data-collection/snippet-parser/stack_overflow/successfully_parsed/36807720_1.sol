contract answer{
  
  event VoteEvent(string ID, bool returnValue);

  function vote(string ID, uint qNum, uint ans) returns (bool) {
    
    VoteEvent(ID, true);
    return true;
  }
}
