pragma solidity ^0.4.4;
contract ScoreStore 
{
    mapping(string => int) PersonScores;

    function SetScore(string name, int score) {
        if(PersonScores[name]>0){
            throw;
        }
        else{
            PersonScores[name] = score;
        }
    }

    function GetScore(string name) returns (int){
        return PersonScores[name];
    }
}
