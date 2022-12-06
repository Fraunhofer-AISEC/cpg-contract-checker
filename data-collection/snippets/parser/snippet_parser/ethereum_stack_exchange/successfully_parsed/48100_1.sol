pragma solidity ^0.4.0;

contract sample {
    string private name;

        function setName(string newName) {
            name = newName;
        }
        function getName() public view returns (string) {
            return (name);
        }
    }
