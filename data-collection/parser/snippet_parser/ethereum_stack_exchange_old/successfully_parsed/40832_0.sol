pragma solidity ^0.4.19

contract MyFirstContract {
    string private name;
    uint private age;

    function setName(string newName) {
        name = newName;
    }

    function getName() returns (string) {
        return name;
    }
}
