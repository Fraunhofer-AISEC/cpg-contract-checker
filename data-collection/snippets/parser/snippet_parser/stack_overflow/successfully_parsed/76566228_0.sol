

pragma solidity ^0.8.18;

contract AgeFinder{

    uint256 ageNumber;

    struct Person {
        uint256 age;
        string name;
    }

    Person[] public listOfPeople;

    mapping (string => uint256) nameToAge;

    function addData( uint256 _age, string memory _name) public {
        listOfPeople.push(Person(_age, _name));
        nameToAge[_name] = _age;
    }
}
