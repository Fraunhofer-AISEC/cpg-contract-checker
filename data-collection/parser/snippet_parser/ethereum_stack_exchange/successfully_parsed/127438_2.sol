
  function endGame(
    uint256 _gameNumber
  ) external onlyRole(CALLER_ROLE) {
    Game storage g = games[_gameNumber];

    require(
      g.maxPlayers > 0,
      "Invalid game"
    );
    require(
      g.status == true,
      "Game already ended"
    );

    uint256 _pot = g.pot;
    uint256 _balance = g.token.balanceOf(address(this));
    require(
      g.pot <= _balance,
      "Not enough of game token in reserve"
    );

    
    g.status = false;

    
    uint256 _rand = _randModulus(100);
    uint256 _total = g.tickets.length - 1;
    uint256 _index = _rand % _total;
    g.winnerAddress = g.tickets[_index];

    
    
    

    
    
    

    
    
    
    

    
    
    IERC20(g.tokenAddress).transfer(g.winnerAddress, _pot);

    
    totalGamesEnded++;

    
    emit GameEnded(
      g.tokenAddress,
      g.winnerAddress,
      g.number,
      _pot
    );
  }
