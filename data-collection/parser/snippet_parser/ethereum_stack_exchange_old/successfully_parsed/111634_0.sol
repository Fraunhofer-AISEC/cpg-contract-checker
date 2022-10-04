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
        Person[] memory _person
    ) public {

       people[msg.sender].push(People(_country, _state, _person));
    }

}

