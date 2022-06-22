function hashSeriesNumber(string series, uint256 number) public pure returns (bytes32)
{
    return keccak256(number, series);
}
