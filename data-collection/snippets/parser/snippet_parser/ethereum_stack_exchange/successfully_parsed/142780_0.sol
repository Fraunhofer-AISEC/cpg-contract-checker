function execute(uint256 proposalId) public payable virtual override returns (uint256) {
    ProposalCore storage proposal = _proposals[proposalId];
    ProposalState status = state(proposalId);
    require(
        status == ProposalState.Succeeded || status == ProposalState.Queued,
        "MG: proposal not successful"
    );
    proposal.executed = true;

    emit ProposalExecuted(proposalId);
    
    _beforeExecute(proposal);
    _execute(proposal);
    _afterExecute(proposal);

    return proposalId;
}
