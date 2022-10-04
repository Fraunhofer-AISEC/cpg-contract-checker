pragma solidity ^0.5.0;

contract Course {
    string public name;

    constructor(string memory _name) public {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }
}
