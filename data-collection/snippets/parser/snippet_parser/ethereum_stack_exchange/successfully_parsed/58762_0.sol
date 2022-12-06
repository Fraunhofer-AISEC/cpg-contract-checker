pragma solidity ^0.4.24;

contract Bank {
    uint private value;


    function Bank(uint amount) {
        value = 10;
    }

    function deposit(uint amount) {
        value += amount;
    }


    function balance() constant returns (uint) {
        return value;
    }

}

contract MyFirstContract is Bank {
    string private name;
    uint private age;

    function setName(string newName) {
        name = newName;
    }

    function getName() returns (string) {
        return name;
    }

    function setAge(uint newAge) {
        age = newAge;
    }

    function getAge() returns (uint) {
        return age;
    }
}
