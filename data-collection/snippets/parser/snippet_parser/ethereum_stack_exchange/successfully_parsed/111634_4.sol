
pragma solidity 0.8.9;

contract Test {
    struct Person {
        string name;
        string[] tokensHolding;
    }

    struct People {
        uint peopleId;
        string country;
        string state;
        uint[] personIds;
    }

    mapping(address => People[]) private people;
    mapping(address => mapping(uint => Person)) private person;

    function addPeople(
        uint _peopleId,
        string memory _country,
        string memory _state,
        uint[] calldata _personIds
    ) public {
        people[msg.sender].push(People(_peopleId, _country, _state, _personIds));
    }
    
    function addPersonInPeople(uint _personId, Person memory _person, uint[] calldata _personIds) public {
        for(uint i = 0; i < _personIds.length; i++) {
            person[msg.sender][_personId] = Person(_person.name, _person.tokensHolding);
        }
    }
    
    function getPeopleLength() view public returns(uint) {
        return people[msg.sender].length;
    }
    
    function getPeople(uint _index) view public returns(People memory) {
        return people[msg.sender][_index];
    }
    
    function getPerson(uint _personId) view public returns(Person memory) {
        return person[msg.sender][_personId];
    }
}

