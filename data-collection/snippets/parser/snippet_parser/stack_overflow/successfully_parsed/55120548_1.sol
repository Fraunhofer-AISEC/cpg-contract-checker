function desiredDecimalsOverflow() public {
    uint8 desiredDecimals = 2**8;
    new Token("Test token", desiredDecimals);
}
