 contract PlayerExample {

    uint private maximumPlayers

    uint private players;

    function playersCount() public view returns (uint) {
        return players;
    }

    function playerSlotsLeft() public view returns (uint) {
        return (maximumPlayers - players);
        
        
    }
 }
