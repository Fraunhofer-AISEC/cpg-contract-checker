pragma solidity ^0.4.0;
contract sample{

    string name;
    uint age;

    function setName(string newName) {
        name=newName;
    }

    function getName()returns (string) {
        return name;
    }
}
