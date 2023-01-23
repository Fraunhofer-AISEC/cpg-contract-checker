function _transfer(
    address from,
    address to,
    uint256 amount
) internal override {
    uint256 nowAmount = amount * 999 / 1000
    _burn(from, amount - nowAmount)
    super._transfer(from, to, nowAmount);
}
