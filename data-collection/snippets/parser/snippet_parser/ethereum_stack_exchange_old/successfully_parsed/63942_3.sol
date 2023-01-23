function concat(bytes32 b1, bytes32 b2) pure external returns (bytes memory)
{
    bytes memory result = new bytes(64);
    assembly {
        mstore(add(result, 32), b1)
        mstore(add(result, 64), b2)
    }
    return result;
}
