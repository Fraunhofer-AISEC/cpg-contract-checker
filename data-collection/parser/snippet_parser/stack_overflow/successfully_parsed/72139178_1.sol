
pragma solidity ^0.8.4;

import "./Game.sol";

contract Bet {
    address public game;



    constructor (address gameContract) {
        game = gameContract;
    }
     
    
    function calculatePayout(uint amount, int scoreDifference) private pure returns(uint) {
        uint abs = uint(scoreDifference > 0 ? scoreDifference : scoreDifference * -1);  
        uint odds = 2 ** abs;
        if(scoreDifference < 0) {
            return amount + amount / odds;
        }
        return amount + amount * odds;
    }

    function getScoreDifference (Game.Teams x) public view returns (int256){
        if (x == Game.Teams.Team1) {
            return Game.team1Score - Game.team2Score;
        } else if (x == Game.Teams.Team2) {
            return Game.team2Score - Game.team1Score;
        }
    }
}

