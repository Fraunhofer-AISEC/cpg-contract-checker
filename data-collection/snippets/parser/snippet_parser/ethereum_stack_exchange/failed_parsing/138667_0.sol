if (externalId == bytes32(0x00)) {
    bytes memory buffer = new bytes(64);
    assembly {
        mstore(add(buffer, 0x20), escrowId)
        mstore(add(buffer, 0x40), timestamp)
                
    }
    externalId = keccak256(buffer);
}
