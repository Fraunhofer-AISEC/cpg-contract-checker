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
        proposal=new Proposal[](no);     
    }    
}
