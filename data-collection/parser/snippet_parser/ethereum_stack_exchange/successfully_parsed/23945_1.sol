pragma solidity ^0.4.15;

contract Owned {
    address owner;

    function Owned() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
contract Whitelist is Owned {
    mapping (address => bool) userAddr;

    function whitelistAddress (address user) onlyOwner {
        userAddr[user] = true;
    }
}
