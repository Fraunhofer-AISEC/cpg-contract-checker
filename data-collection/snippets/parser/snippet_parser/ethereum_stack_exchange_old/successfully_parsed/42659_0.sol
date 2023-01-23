function foo(bytes memory data) internal pure returns (bytes32[] memory output) {
    require(data.length % 32 == 0);
    output = new bytes32[](data.length / 32);
    for (uint256 i = 32; i <= output.length * 32; i += 32) {
        assembly {mstore(add(output, i), mload(add(data, i)))}
    }
}
