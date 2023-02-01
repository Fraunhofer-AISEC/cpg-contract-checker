
pragma solidity ^0.8.13;

contract PocketCrypto {
    enum Role{ GUARDIAN, WARD} 

    mapping(address => Role) public role;

    function setRole(Role _role) public {
        role[msg.sender] = _role;
    }
}

