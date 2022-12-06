function getUint(address addr, bytes memory data) internal view returns (uint result) {
    result = 0;

    assembly {
        let status := staticcall(16000, addr, add(data, 32), mload(data), 0, 0)

        
        if eq(status, 1) {
            if eq(returndatasize(), 32) {
                returndatacopy(0, 0, 32)
                result := mload(0)
            }
        }
    }
}
