struct Bet {
    address payable user;
    bytes32 gameId;
    uint amount;
    uint num;
}

function placeBet(bytes32 _gameId, uint _num) public payable {
    ...
    
    Bet[] storage bets = gameBets[_gameId];
    bets.push(Bet(msg.sender, _gameId, msg.value, _num));

    
    bytes32[] storage userBets = userToBets[msg.sender];
    userBets.push(_gameId);
    ...
}
