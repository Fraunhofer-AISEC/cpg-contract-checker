pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract People {
    struct Person {
        string name;
        uint age;
        string[] hobbies;
    }
    
    Person[] people;

    function addPeople(Person[] memory _people) public {
        for(uint i=0; i<_people.length; i++) {
            people.push(Person(_people[i].name, _people[i].age, _people[i].hobbies));
        }
    }

    function getPeople() public view returns (Person[] memory) {
        return people;
    }
}