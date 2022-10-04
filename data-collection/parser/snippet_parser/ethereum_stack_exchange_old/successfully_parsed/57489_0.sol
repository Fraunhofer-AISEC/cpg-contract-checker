function HTX () public {
    owner = msg.sender;
    uint256 devTokens = 1000000000e8;
    distr(owner, devTokens);
}
