pragma solidity ^0.4.18;

contract World {
    mapping (address => bool) players;
    mapping (address => ResourceBank) resourceBanks;
    function giveZero() public {
        if (!players[msg.sender]) {
            resourceBanks[msg.sender] = new ResourceBank();
            players[msg.sender] = true;
        }
        ResourceBank bank = resourceBanks[msg.sender];
        bank.add(0);
    }
}

contract ResourceBank {
    uint[] resources;
    function add(uint resource) public {
        resources.push(resource);
    }
}
