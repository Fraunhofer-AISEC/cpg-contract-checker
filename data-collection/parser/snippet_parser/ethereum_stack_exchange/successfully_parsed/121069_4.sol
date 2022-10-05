function foo(address addr) public view returns (uint256[] memory) {
    return userOwnedTokens[addr];
}
