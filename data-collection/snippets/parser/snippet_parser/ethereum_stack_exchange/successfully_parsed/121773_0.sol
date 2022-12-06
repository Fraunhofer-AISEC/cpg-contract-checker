function vote(uint proposal) external {
    Voter storage sender = voters[msg.sender];
    require(sender.weight != 0, "Has no right to vote"); 
    require(!sender.voted, "Already voted."); 
    sender.voted = true;
    sender.vote = proposal;
    proposals[proposal].voteCount += sender.weight;
}
