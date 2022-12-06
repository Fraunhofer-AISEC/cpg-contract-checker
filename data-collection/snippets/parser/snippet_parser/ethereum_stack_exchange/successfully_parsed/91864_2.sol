constructor(string[] memory _prices0, string[] memory _prices1) public {
    uint256 length = _prices0.length;
    require(length == _prices1.length, "invalid input length");
    for (uint256 i = 0; i < length; i++) {
        prices[i] = Price({
            Price0: _prices0[i],
            Price1: _prices1[i]
        });
    }
}
