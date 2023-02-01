for (uint256 i = 0; i < tokenID.length; i++) {
    uint256 levelLen    = numOfDigits(level[i]);
    uint256 propertyLen = numOfDigits(property[i]);
    uint256 itemLen     = numOfDigits(item[i]);
    tokenID[i] =
        level[i] +
        property[i] * 10 ** levelLen +
        item[i] * 10 ** (propertyLen + levelLen) +
        10 ** (itemLen + propertyLen + levelLen);
}
