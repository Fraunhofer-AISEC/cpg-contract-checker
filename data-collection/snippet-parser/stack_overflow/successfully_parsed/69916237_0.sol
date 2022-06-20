pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract Token {
    bytes32 public merkleRoot;
    event MerkleRootChanged(bytes32 merkleRoot);
    event Leaf(bytes32 leaf);
    function setMerkleRoot(bytes32 _merkleRoot) external  {
        require(merkleRoot == bytes32(0), "Token: Merkle root already set");
        merkleRoot = _merkleRoot;
        emit MerkleRootChanged(_merkleRoot);
    }
    function claimToken(uint256 tokenId, bytes32[] memory merkleProof) public returns (bool){
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, tokenId));
        emit Leaf(leaf);
        return MerkleProof.verify(merkleProof, merkleRoot, leaf);
    }
}