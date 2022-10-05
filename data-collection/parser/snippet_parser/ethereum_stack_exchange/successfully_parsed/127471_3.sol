pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract Example {
  
  function verify(uint256 amount, bytes32[] memory proof) public view returns (bool) {
    bytes32 leaf = keccak256(abi.encodePacked(msg.sender, amount));
    bytes32 root = 0x399f97e5a37a31d24b746bb2d8fa5212fbe3c0f7ceb4b69ce3c9f37d0379ff72;
    return MerkleProof.verify(proof, root, leaf);
  }

}
