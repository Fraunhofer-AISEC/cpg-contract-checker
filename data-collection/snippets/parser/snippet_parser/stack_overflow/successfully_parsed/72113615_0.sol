

pragma solidity ^0.7.0;

contract Database {
   
 struct Team {
        string engineer;
        mapping (string=>uint) numbers;
    }

    mapping(string=>team) teams;

    function addTeams(string calldata teamName, string calldata engineer) public {
        Team storage team = teams [teamName];
        team.engineer = engineer;
    }

    function addDrawingNumber(string calldata teamName, string calldata engineerName, uint number) public {
        Team storage team = teams [teamName];
        team.numbers[engineerName] = number;
    }
    
    function getDrawingNumber(string calldata teamName, string calldata engineerName) public view returns (uint) {
        Team storage team = teams [teamName];
        return team.numbers[engineerName]
   ; }
}
