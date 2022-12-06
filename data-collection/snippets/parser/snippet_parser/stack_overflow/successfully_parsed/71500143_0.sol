function pickWinner() restricted candidatesLimit view returns(string){
    uint winner;
    uint max= 0;
    for(uint i=0; i < candidatesCount; i++){
        Candidates storage candidate = candidates[i];
        if(candidate.votingCounts > max){
            winner = i;
        }
    }
    Candidates storage winnerCandidate = candidates[winner];
    return (winnerCandidate.name);
}
