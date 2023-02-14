function determineTransactionOrder(
  uint256 blockNumber1,
  uint256 nonce1,
  uint256 blockNumber2,
  uint256 nonce2
) public view returns (string) {
  if (blockNumber1 < blockNumber2) {
    return "Transaction 1 was executed first.";
  } else if (blockNumber1 > blockNumber2) {
    return "Transaction 2 was executed first.";
  } else {
    if (nonce1 < nonce2) {
      return "Transaction 1 was executed first.";
    } else {
      return "Transaction 2 was executed first.";
    }
  }
}
