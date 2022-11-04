function getOtherTokenDecimals(address tokenAddress) external returns (uint8) {
    IBEP20 tokenInstance = IBEP20(tokenAddress);
    return tokenInstance.decimals();
}
