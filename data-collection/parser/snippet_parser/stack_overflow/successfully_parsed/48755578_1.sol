pragma solidity ^0.4.19;

contract LoopExample {
  bytes32[] proofs;
  
  function addProof(bytes32 proof) public {
    if (!hasProof(proof))
      proofs.push(proof);
  }
  
  function hasProof(bytes32 proof) public constant returns (bool) {
    for (uint256 i = 0; i < proofs.length; i++) {
      if (proofs[i] == proof) {
        return true;
      }
    }

    return false;
  }
}
