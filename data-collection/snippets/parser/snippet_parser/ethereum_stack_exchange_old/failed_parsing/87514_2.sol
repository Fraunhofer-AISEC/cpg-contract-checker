function fulfillInt(
  bytes4 fulfillCallback,
  uint256 value,
  uint256 requestId,
  uint256 requestPrice
) external onlySimplOracle SimplorFulfill(requestId, requestPrice) {...
