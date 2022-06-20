contract Ballot {
  function Ballot(uint8 _numProposals) {}
  function giveRightToVote(address voter) {}
  function delegate(address to) {}
  function vote(uint8 proposal) {}
  function winningProposal() constant returns (uint8 winningProposal) {}
}
