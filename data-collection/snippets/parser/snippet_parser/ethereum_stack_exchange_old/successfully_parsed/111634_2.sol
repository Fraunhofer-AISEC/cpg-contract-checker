
pragma solidity 0.8.9;

contract Test {
    struct Person {
        string name;
        string[] tokensHolding;
    }

    struct People {
        string country;
        string state;
        Person[] person;
    }

    mapping(address => People[]) private people;

    function addPeople(
        string memory _country,
        string memory _state,
        Person[] memory _person,
        uint _personLength
    ) public payable {
        uint _lengthOfPeople = people[msg.sender].length;

    
    
        uint _lengthOfPersonInPeople = people[msg.sender][_lengthOfPeople].person.length;
        people[msg.sender][_lengthOfPeople].country = _country;
        people[msg.sender][_lengthOfPeople].state = _state;
        
        for (uint i = 0; i < _personLength; i++) {
            people[msg.sender][_lengthOfPeople].person[_lengthOfPersonInPeople].name = _person[i].name; 
            people[msg.sender][_lengthOfPeople].person[_lengthOfPersonInPeople].tokensHolding = _person[i].tokensHolding; 
        }
    }
    
    function getPeopleLength() view public returns(uint) {
        return people[msg.sender].length;
    }
    
    function getPeople(uint _index) view public returns(People memory) {
        return people[msg.sender][_index];
    }

}
