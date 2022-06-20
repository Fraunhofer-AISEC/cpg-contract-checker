function joinGame() public payable returns(address) {
     
        require(msg.sender != player1, 'both player cant be same');
        player2 = msg.sender;
        player2Escrow = 100; 
        return player2;
    }
