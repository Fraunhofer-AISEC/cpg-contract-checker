function isVoter(address proposal, address voter) public view returns(bool canIndeed) {
  require(proposalsByAddress[proposal]); 
  return contributors[voter]; 
}
