function _verify(
    bytes32[] calldata merkleProof,
    address sender,
    uint256 maxAmount
) private view returns (bool) {
    bytes32 leaf = keccak256(
        abi.encodePacked(sender, maxAmount.toString())
    );
    return MerkleProof.verify(merkleProof, merkleRoot, leaf);
}
