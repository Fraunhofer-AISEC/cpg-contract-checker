function vote(
    uint _proposalID,
    bool _supportsProposal
) onlyTokenholders noEther returns (uint _voteID) {

    Proposal p = proposals[_proposalID];
    if (p.votedYes[msg.sender]
        || p.votedNo[msg.sender]
        || now >= p.votingDeadline) {

        throw;
    }
