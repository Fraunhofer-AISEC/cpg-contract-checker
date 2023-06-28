function endVote(uint[][] memory ballots)
    public
    inState(State.Voting)
    onlyOfficial
{
    state = State.Ended;

    
    uint largest = 0;
    string memory winnerCandidate;

    
    for(uint i = 0; i < ballots.length; i++) {
        uint voterId = ballots[i][0];
        uint voteone = ballots[i][1];
        require(voteone < candidates.length, "Invalid candidate index");
        candidateVotes[voteone]++;
    }

    
    for(uint i = 0; i < candidates.length; i++) {
        if(candidateVotes[i] > largest) {
            largest = candidateVotes[i];
            winnerCandidate = candidates[i].candidateName;
        } 
    }

    finalResult = winnerCandidate;
    emit voteEnded(finalResult);
} 
