pragma solidity ^0.4.24;

contract ScoreStore{
    mapping(string => uint) PersonScores;

    function AddPersonScore(string name, uint startingScore) public {
        require(PersonScores[name]>0);
        PersonScores[name] = startingScore;
    }

    function GetScore(string name) public view returns (uint){
        return PersonScores[name];
    }
}
