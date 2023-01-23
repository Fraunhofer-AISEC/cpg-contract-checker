pragma solidity ^0.8.4;

import "./Game.sol";

contract Bet {
        Game game;

    constructor(address _address) {
        game = Game(_address);
    }

    function getScoreDifference(Game.Teams _team) public view returns(int) {
        if(_team == Game.Teams.Team1) {
            return game.team1Score() - game.team2Score();
        }
        else if(_team == Game.Teams.Team2) {
            return game.team2Score() - game.team1Score();
        }
        }
}