modifier canVote(address user, uint proposal){
    require(!hasVoted[proposal][user]);
    _;
}

function vote(uint proposal)
public 
canVote(msg.sender, proposal) 
{
    hasVoted[proposal][msg.sender] = true; 
    votesCount[proposal]++;
    
}
