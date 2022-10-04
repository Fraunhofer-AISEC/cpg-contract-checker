pragma solidity ^0.8.0;

contract Generator {
    address immutable public owner;
    string public matchGenerated;
    Management[] public bettingHistory;

    constructor(string memory _league, string memory _match) {
        owner = msg.sender;
        matchGenerated = string(abi.encodePacked(_league, "_", _match));
        Management newBetContract = new Management(address(this));
        bettingHistory.push(newBetContract);
    }
}
