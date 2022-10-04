function __callback(bytes32 myid, string result) {
  if (msg.sender != oraclize_cbAddress()) revert();
  emit LogPriceUpdated(result);
 for (uint i=0; i < betId + 1; i++) {
    if (compareStrings("up", result)) {
        gameInfo[currentPrizePeriodTime][i].choice = result;
  }
 }
}
