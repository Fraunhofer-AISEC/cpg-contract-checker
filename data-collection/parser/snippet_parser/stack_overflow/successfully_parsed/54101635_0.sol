uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals()));


function decimals() public view returns (uint8) {
    return _decimals;
}
