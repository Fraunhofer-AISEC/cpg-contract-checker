function balanceOf(string user) view public returns (uint256) {
  address userAddress;
  userAddress = addressTable[user];
  return( balance(userAddress);
}
