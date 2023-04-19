
pragma solidity ^0.8.0;

contract SimpleStoragePractice {

    struct People {
        uint customerId;
        string customerName; 
    }

    People[] public peopleArray;

    function addToPeopleArray (uint _customerId, string memory _customerName) public {
        peopleArray.push(People(_customerId, _customerName));
    }

    function updatePeopleArray (uint _peopleArrayIndex, uint _customerId, string memory _customerName) public{
        peopleArray[_peopleArrayIndex] = People(_customerId, _customerName);
    }

    function remove (uint _peopleArrayIndex) public {
        delete peopleArray[_peopleArrayIndex];
    }

}
