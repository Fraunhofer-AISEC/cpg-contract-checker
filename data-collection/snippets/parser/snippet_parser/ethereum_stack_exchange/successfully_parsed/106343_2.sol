pragma solidity^0.5.0;

contract Contract {
    string public name;

    function Contracts(string memory passedName) public {
        name = passedName;
    }

    function setName(string memory newName) public {
        name = newName;

    }

}
