function tokenBalance(address addr) public view returns (uint256) {
   return token.balanceOf(addr);
}
