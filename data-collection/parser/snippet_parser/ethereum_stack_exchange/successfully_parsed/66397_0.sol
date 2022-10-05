pragma solidity ^0.5.2;

contract Random {
    address[] public participants;

    function addParticipant() public {
        participants.push(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);
        participants.push(0x583031D1113aD414F02576BD6afaBfb302140225);
        participants.push(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);
    }
}
