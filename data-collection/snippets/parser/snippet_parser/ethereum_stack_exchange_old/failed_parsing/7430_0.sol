event Voted(uint proposalID, bool position, address voter, string justification);
...
struct Proposal {
    address recipient;
    uint amount;
    string description;
    uint votingDeadline;
    bool executed;
    bool proposalPassed;
    bool proposalCanRun;
    uint numberOfVotes;
    int remainingVotesToPass;
    int currentResult;
    bytes32 proposalHash;
    Vote[] votes;
    mapping (address => bool) voted;
}    

struct Vote {
    bool inSupport;
    address voter;
    string justification;
}
...
function voteOn(
    uint proposalNumber,
    bool supportsProposal,
    string justificationText
)
    onlyMembers
    returns (uint voteID)
{    

    Proposal p = proposals[proposalNumber];         
    if (p.voted[msg.sender] == true) throw;         
    p.voted[msg.sender] = true;                     
    p.numberOfVotes++;                              
    if (supportsProposal) {                         
        p.currentResult++;                          
    } else {                                        
        p.currentResult--;                          
    }

    ...

    p.votes[p.numberOfVotes]= Vote({inSupport: supportsProposal, voter: msg.sender, justification: justificationText});   

    ...


    
    Voted(proposalNumber,  supportsProposal, msg.sender, justificationText);
}
...
