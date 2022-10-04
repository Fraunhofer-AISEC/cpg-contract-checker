contract Voting {
address[100] public voters;


function vote(uint voterId) public view returns (uint) {
  require(alreadyVoted(voteId));

  voters[voterId] = msg.sender;

  return voterId;
}


function getVoters() public returns (address[16]) {
  return voters;
}
}
