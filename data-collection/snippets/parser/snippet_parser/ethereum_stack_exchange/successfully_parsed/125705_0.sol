function depositCrv(uint amount, uint minAmount) public {
        WETH.approve(tricrypto, type(uint).max);
        tricrypto.add_liquidity(amount, minAmount);
}
