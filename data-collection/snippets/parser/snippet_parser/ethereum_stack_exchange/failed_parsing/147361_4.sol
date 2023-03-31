function propose(
    address[] memory targets,
    uint256[] memory values,
    string[] memory signatures,
    bytes[] memory calldatas,
    string memory description
) public onlyMembers returns (uint256) {

    ...

    proposalCount++;
    uint256 newProposalId = proposalCount;
    Proposal storage newProposal = proposals[newProposalId];

    newProposal.id = newProposalId;
    newProposal.proposer = msg.sender;
    ...

    emit ProposalCreated(
        newProposalId,
        msg.sender,
        ...
    );
    return newProposal.id;
}
