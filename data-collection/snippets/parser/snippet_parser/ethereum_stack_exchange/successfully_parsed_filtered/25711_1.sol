contract Vote {

  struct VoteStruct {
    bool wasCast;
    
  }

  bytes32[] public voteList;
  mapping(bytes32 => VoteStruct) public voteStructs;

  function getVoteCount() public constant returns(uint voteCount) {
    return voteList.length;
  }   
}
