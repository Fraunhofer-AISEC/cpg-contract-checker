contract Ex is ERC721{
  bytes32 public merkleRoot;

  function updateMerkleRoot(bytes32 newRoot) external onlyOwner {
    merkleRoot = newRoot;
  }

  function mintWihteList(uint256 _count, bytes32[] calldata merkleProof) public payable {
    bytes32 node = keccak256(abi.encodePacked(msg.sender));
    require(
        MerkleProof.verify(merkleProof, merkleRoot, node), 
        "MerkleDistributor: Invalid proof."
    );
  }
}
