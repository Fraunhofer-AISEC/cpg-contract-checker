pragma solidity 0.7.6;



contract Vote {
           
    struct Proposal {
        uint votecount;
    }
    
    Proposal[] proposals;
        
    constructor(uint no) {
        Proposal memory p;
        for(uint i=0; i<no; i++) {
            proposals.push(p);
        }
    }    
}
