contract Game {
  address[] public winners;
  function declareWinner(address winner) public onlyOwner returns(bool success) {
    winners.push(winner);
    emit LogWinnerDeclared(msg.sender, winner);
  }
}
