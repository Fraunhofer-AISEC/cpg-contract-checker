
pragma solidity 0.8.15;

contract Character {
    string private _name;

    constructor(string memory name) public {
        _name = name;
    }

    function getName() public view returns (string memory) {
        return _name;
    }
}
