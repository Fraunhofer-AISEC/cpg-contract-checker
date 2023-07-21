contract StorageLocation {
    function calculateStorageLocation(uint256 position, uint128 key) public pure returns (bytes32) {
        bytes32 paddedKey = bytes32(uint256(key));
        bytes32 paddedPosition = bytes32(position);

        return keccak256(abi.encodePacked(paddedKey, paddedPosition));
    }
}
