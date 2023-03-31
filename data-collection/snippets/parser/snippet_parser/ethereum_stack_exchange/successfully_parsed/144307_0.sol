

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

error InvalidAddress();

contract MyContract {

  bytes32 private _merkleRoot;

  function test(bytes32[] calldata merkleProof) external payable {
    bytes32 leaf = keccak256(abi.encodePacked(msg.sender));

    if (!MerkleProof.verify(merkleProof, _merkleRoot, leaf)) revert InvalidAddress();
  }
}
