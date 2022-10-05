function _buildDomainSeparator(bytes32 typeHash, bytes32 nameHash, bytes32 versionHash) private view returns (bytes32) {
    return keccak256(abi.encode(typeHash, nameHash, versionHash, block.chainid, address(this)));
    
}
