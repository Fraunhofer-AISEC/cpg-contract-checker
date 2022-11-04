function hashSeriesNumber(string calldata series, uint256 number) external pure returns (bytes32)
{
    return keccak256(abi.encode(number, series));
}
