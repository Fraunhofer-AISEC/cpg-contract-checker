function getScoreDifference (Game.Teams x) public view returns (int256){
    if (x == Game.Teams.Team1) {
        return Game.team1Score - Game.team2Score;
    } else if (x == Game.Teams.Team2) {
        return Game.team2Score - Game.team1Score;
    }
}
