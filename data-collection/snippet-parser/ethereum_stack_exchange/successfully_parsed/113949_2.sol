    function test() public payable {
        address player1 = getPlayers()[0];
        payable(player1).transfer(msg.value);
    }
