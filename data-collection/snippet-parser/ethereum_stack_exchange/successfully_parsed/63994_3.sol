function convertToArrayOfLength14(bytes memory data) public pure returns (uint256[] memory output)
{
    output = new uint256[](14);
    for (uint256 i=32; i<=output.length*32; i+=32)
    {
        assembly { mstore(add(output, i), mload(add(data, i))) }
    }
}
