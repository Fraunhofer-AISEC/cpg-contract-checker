function voteForProposal(int _proposalId) public payable isMember currentlyRaising returns (bool) {
    voteBank[msg.sender] += msg.value;
    voters.push(msg.sender);
    proposalVotes[_proposalId] += msg.value;
    return true;
  }
