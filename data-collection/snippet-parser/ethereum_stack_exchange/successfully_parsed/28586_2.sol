function hasher(uint256 i, string str) public pure returns (bytes32)
{
    return keccak256(i) ^ keccak256(str);
}
