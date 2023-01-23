pragma solidity ^0.5.0;

contract Gaming {
    
    address public owner;
    bool public online;

    struct Player {
        uint wins;
        uint losses;
    }

    mapping (address => Player) public players;

    constructor() public payable {
        owner = msg.sender;
        online = true;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

}
