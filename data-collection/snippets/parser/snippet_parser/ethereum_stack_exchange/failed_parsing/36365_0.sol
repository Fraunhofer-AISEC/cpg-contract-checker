function getUserBetsfromBettingObject(uint index, address callerAddress) constant returns (uint) {
BettingObject memory currentBettingObject = arrayOfBettingObjects[index];
if (currentBettingObject.currentState == GameState.bitcoinUpWon) {
  return currentBettingObject.betsOnBitcoinGoesUp[callerAddress];
} else if (currentBettingObject.currentState == GameState.bitcoinDownWon) {
  return currentBettingObject.betsOnBitcoinGoesDown[callerAddress];
} else {
  return 0;
}
