pragma solidity >=0.7.0 <0.8.0;
contract Vote
{               
    struct Proposal
    {
        uint votecount;
    }
    Proposal[] proposal;
                        
    constructor(uint no)
    {               
        for(uint i=0;i<no;i++)
            proposal.votecount.push(0);
    }    
}
