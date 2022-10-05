
  function buyTicket(
    uint256 _gameNumber,
    uint256 _numberOfTickets
  ) external {
    Game storage g = games[_gameNumber];

    require(
      g.maxPlayers >= 0,
      "Invalid game"
    );
    require(
      g.status == true,
      "Game already ended"
    );
    require(
      _numberOfTickets > 0,
      "Buy at least 1 ticket"
    );

    
    uint256 _totalCost = g.ticketPrice * _numberOfTickets;
    require(
      g.token.allowance(msg.sender, address(this)) >= _totalCost,
      "Insufficent game token allowance"
    );

    
    bool _isNewPlayer = false;

    
    uint256 _playerTicketCount = g.players[msg.sender];

    
    if (_playerTicketCount == 0) {
      if (g.playerCount == g.maxPlayers) {
        revert("Too many players in game");
      }
      _isNewPlayer = true;
    }
    
    
    uint256 _playerTicketNextCount = _playerTicketCount + _numberOfTickets;
    require(
      _playerTicketNextCount <= g.maxTicketsPlayer,
      "Exceeds max player tickets, try lower value"
    );

    
    
    g.token.transferFrom(msg.sender, address(this), _totalCost);

    
    g.pot += _totalCost;

    
    if (_isNewPlayer) {

      
      g.playerCount++;

      
      g.playersIndex.push(msg.sender);
    }

    
    g.players[msg.sender] = _playerTicketNextCount;

    
    
    uint256 _i;
    while (_i != _numberOfTickets) {
      g.tickets.push(msg.sender);
      _i++;
    }

    
    g.ticketCount += _numberOfTickets;

    
    emit TicketBought(
      msg.sender,
      g.number,
      g.playerCount,
      g.ticketCount
    );
  }
