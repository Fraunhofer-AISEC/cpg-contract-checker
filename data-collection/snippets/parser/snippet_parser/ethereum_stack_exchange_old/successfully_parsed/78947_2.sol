    function pickWinner() public payable restricted {
        require(players.length > 0, "Need at least one player."); 
        uint index = random() % players.length;
        address payable winner = players[index];
        winner.transfer(address(this).balance);
        players = new address payable [](0);
    }
