function decider(nbaTeam[] memory team) public {
    for (uint i=0; i < 31; i++) {
        if (team[i].oRtg > avgOrtg && team[i].dRtg < avgDrtg) {
            niceTeams.push(team);    
        } else if (team[i].oRtg <= avgOrtg && team[i].dRtg >= avgDrtg) {
            naughtyTeams.push(team);
        }
    }
}
