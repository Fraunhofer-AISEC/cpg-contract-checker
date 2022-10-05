pragma solidity ^0.4.15;

contract Whitelist is Owned {
    mapping (address => bool) userAddr;

    function whitelistAddress (address[] users) onlyOwner {
        for (uint i = 0; i < users.length; i++) {
            userAddr[users[i]] = true;
        }
    }
}
