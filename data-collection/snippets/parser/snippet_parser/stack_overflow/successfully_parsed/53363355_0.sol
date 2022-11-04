constructor(bytes32[] memory proposalNames) public {
    chairperson = msg.sender;
    voters[chairperson].weight = 1;

    
    
    
    for (uint i = 0; i < proposalNames.length; i++) {
        
        
        
        proposals.push(Proposal({
            name: proposalNames[i],
            voteCount: 0
        }));
    }
}
