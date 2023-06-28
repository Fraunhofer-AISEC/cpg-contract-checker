contract Game {
  address[] public winners;
  function submitWinningMove(bytes32 move) public returns(bool success) {
    require(gameIsOn());
    require(moveIsAllowed(move));
    require(moveIsWinner(move));
    winners.push(msg.sender);
    require(closeGame());
    emit LogWinningMove(msg.sender, move);
    return true;
   }
}
