function voterDetails(address user) returns (uint256, mapping (bytes32 => uint256)) {
  return (voterInfo[user].tokensBought, voterInfo[user].tokensUsed);
}
