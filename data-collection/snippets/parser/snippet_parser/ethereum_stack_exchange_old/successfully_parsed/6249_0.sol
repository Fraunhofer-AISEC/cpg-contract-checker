function executeProposal(uint proposalNumber, bytes transactionBytecode) returns (int result) {
    Proposal p = proposals[proposalNumber];
    if (p.executed) throw;

    p.recipient.call.value(p.amount)(transactionBytecode);

    p.executed = true;
}