function _transfer(
    address from,
    address to,
    uint256 value
) internal override {
    uint256 toBurn = value * amountToBurn / 100;
    _burn(from, toBurn);
    super._transfer(from, to, value);
}
