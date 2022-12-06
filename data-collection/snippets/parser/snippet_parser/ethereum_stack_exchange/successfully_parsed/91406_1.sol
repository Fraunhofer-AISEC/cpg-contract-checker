function copyBytes(bytes memory _bytes) private pure returns (bytes memory)
{
    bytes memory copy = new bytes(_bytes.length);
    uint256 max = _bytes.length + 31;
    for (uint256 i=32; i<=max; i+=32)
    {
        assembly { mstore(add(copy, i), mload(add(_bytes, i))) }
    }
    return copy;
}
