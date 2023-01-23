pragma solidity ^0.8.7;

contract MyTestContarct{
    Person[] public people;

    uint256 public peopleCount;

    struct Person {
        string _firstName;
        string _lastName; 
    }

    function addPerson(string memory _firstName, string memory _lastName) public{   
    people.push(Person(_firstName, _lastName));
    peopleCount +=1;
        
    }

    uint[] IntArrayTest;

    uint256 public elementsCounter;

    struct Numbers{
        uint _number;
    }
    

    function addElements(uint _number) public{
        IntArrayTest.push(Numbers(_number));
        elementsCounter +=1;

    } 
} 
