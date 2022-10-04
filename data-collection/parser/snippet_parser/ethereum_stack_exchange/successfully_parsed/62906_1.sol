pragma solidity^0.5.0;

contract Contract {
    string public name;

    function Contracts(string passedName) public {
        name = passedName;
    }

    function setName(string newName) public {
        name = newName;

    }

}
