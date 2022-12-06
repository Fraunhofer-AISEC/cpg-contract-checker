function transferGameBalances(uint _gameId) external payable { 
    Game storage game = gamesById[_gameId];
    require(game.status == GameStatus.GAME_OVER);
    require(msg.sender == owner || msg.sender == game.player1 || game.player2);

    if (!game.player1.send(game.p1_balance)) { 
        ownerBalance += game.p1_balance;
    }

    if (!game.player2.send(game.p2_balance)) { 
        ownerBalance += game.p2_balance;
    }

}
