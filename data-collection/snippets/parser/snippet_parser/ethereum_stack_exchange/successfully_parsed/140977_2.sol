pragma solidity ^0.5.0;

contract Example {
    
    string name;

    
    bytes32 hash;

    
    address owner;

    function setName(string memory _name) public {
        name = _name;
    }

    function setHash(bytes32 _hash) public {
        hash = _hash;
    }

    function setOwner(address _owner) public {
        owner = _owner;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function getHash() public view returns (bytes32) {
        return hash;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}

