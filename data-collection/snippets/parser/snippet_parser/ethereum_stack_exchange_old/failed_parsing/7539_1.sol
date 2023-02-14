 function newProposal(
    address beneficiary,
    uint etherAmount,
    string JobDescription,
    bytes transactionBytecode
)
    onlyMembers
    returns (uint proposalID)
{
... 
}
