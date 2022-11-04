function pickWinner() public restricted {
        uint index = random() % players.length;
        payable (players[index].transfer(this).balance); <-- bad line trying to transfer funds of the contract to a address.
        players = new address[](0);
    }
