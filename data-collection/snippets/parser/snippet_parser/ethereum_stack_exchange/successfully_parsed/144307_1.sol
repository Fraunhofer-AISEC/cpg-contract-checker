function test(bytes32[] calldata merkleProof) external payable {
  bytes32 leaf;
  address sender = msg.sender;

  assembly {
    mstore(0x00, sender)
    leaf := keccak256(0x00, 0x20)
  }
  
  if (!MerkleProof.verify(merkleProof, _merkleRoot, leaf)) revert InvalidAddress();
}
