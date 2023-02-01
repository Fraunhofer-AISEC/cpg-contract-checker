struct Proposal {
    address recipient;
    uint amount;
    string description;
    uint votingDeadline;
    bool executed;
    bool proposalPassed;
    uint numberOfVotes;
    bytes32 proposalHash;
    Vote[] votes;
    mapping (address => bool) voted;
}


function vote(uint proposalNumber, bool supportsProposal)
    onlyShareholders
    returns (uint voteID)
{
    Proposal p = proposals[proposalNumber];
    if (p.voted[msg.sender] == true) throw;

    voteID = p.votes.length++;
    p.votes[voteID] = Vote({inSupport: supportsProposal, voter: msg.sender});
    p.voted[msg.sender] = true;
    p.numberOfVotes = voteID +1;
    Voted(proposalNumber,  supportsProposal, msg.sender);
}

function executeProposal(uint proposalNumber, bytes transactionBytecode) returns (int result) {
    Proposal p = proposals[proposalNumber];
    
    if (now < p.votingDeadline  
        ||  p.executed        
        ||  p.proposalHash != sha3(p.recipient, p.amount, transactionBytecode)) 
        throw;

    
    uint quorum = 0;
    uint yea = 0;
    uint nay = 0;

    for (uint i = 0; i <  p.votes.length; ++i) {
        Vote v = p.votes[i];
        uint voteWeight = sharesTokenAddress.balanceOf(v.voter);
        quorum += voteWeight;
        if (v.inSupport) {
            yea += voteWeight;
        } else {
            nay += voteWeight;
        }
    }

    
    if (quorum <= minimumQuorum) {
        
        throw;
    } else if (yea > nay ) {
        
        p.executed = true;
        if (!p.recipient.call.value(p.amount * 1 ether)(transactionBytecode)) {
            throw;
        }
        p.proposalPassed = true;
    } else {
        p.proposalPassed = false;
    }
    
    ProposalTallied(proposalNumber, result, quorum, p.proposalPassed);
}
