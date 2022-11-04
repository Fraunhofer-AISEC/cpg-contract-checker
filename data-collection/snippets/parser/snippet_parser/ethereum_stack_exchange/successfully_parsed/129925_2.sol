
pragma solidity ^0.8.14;

contract Human {
    struct Dog {
        string name;
    }

    Dog[] public dogs;
    uint256 public currDogs;

    function addDog() public {
        dogs.push(Dog('test'));
        currDogs++;
    }
}
