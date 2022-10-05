
pragma solidity ^0.8.7;
contract Voting{
    
    address public owner = msg.sender;

    struct AddCandidate 
    {
        string name;
        string party;
        uint age;
        string qualification;
    }

    mapping(string=>AddCandidate) candidate;

    function addMembers(string memory _name, string memory _party, uint _age, string memory _qualification) public
    {
        candidate[_name] = AddCandidate({
            name:_name,
            age:_age,
            party:_party,
            qualification:_qualification
        });
        
    }

    function showMembers(string memory name) public view returns (string memory _name, string memory _party, uint _age, string memory _qualification)
    {
        
        _name = candidate[name].name;

        _party = candidate[name].party;

        _age = candidate[name].age; 

        _qualification = candidate[name].qualification;
    }
   
}
