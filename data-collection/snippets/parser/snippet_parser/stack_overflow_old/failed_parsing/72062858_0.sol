if (awaitingMatch != address(0)) {
  userMap[awaitingMatch].opponent = msg.sender;
  userMap[awaitingMatch].matchedBlock = block.number;
  userMap[awaitingMatch].matchWins = 0;
  userMap[awaitingMatch].playAmount = msg.value;
  userMap[awaitingMatch].winsNeeded = winsToWin;

  userMap[msg.sender].opponent = awaitingMatch;
  userMap[msg.sender].matchedBlock = block.number; 
  userMap[msg.sender].matchWins = 0;
  userMap[msg.sender].winsNeeded = winsToWin;

  awaitingMatch = address(0);

  emit Match(msg.sender);
  emit Match(userMap[msg.sender].opponent);


} else {
  awaitingMatch = msg.sender;
}
