

pragma solidity ^0.8.0;

abstract contract IPersonContract {
    struct Person {
        string firstName;
        string lastName;
        uint8 age;
        uint256 favNumber;
    }

    function getPerson(uint256 index) public view virtual returns (Person memory);

}

contract PersonContract is IPersonContract {
    Person[] private _people;

    function getPerson(uint256 index) public view override returns (Person memory) {
        return _people[index];
    }

}
