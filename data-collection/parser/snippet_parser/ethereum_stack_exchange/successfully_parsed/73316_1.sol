pragma solidity ^0.5.1; 

contract PlayerExample {
    uint private maximumPlayers = 10;
    uint private players = 5;

    function playerSlotsLeft() public view returns (uint) {
        return (maximumPlayers - players);
    }
}
