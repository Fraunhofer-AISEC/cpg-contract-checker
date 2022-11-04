pragma solidity ^0.8.4;

contract Game {
    int public team1Score;
    int public team2Score;

    enum Teams { Team1, Team2 }

    function addScore(Teams teamNumber) external {
        if (teamNumber == Teams.Team1) {
            team1Score +=1;
        } else if (teamNumber == Teams.Team2) {
            team2Score +=1;
        }
    }
}

