pragma solidity ^0.5;

contract ProofOfExistence3 {
  mapping (bytes32 => bool) private proofs;
  
  function storeProof(bytes32 proof)  public{
    proofs[proof] = true;
  }
  
  function notarize(string memory document) public {
   **bytes32 proof = proofFor(document);**
    storeProof(proof);
  }
  
  function proofFor(bytes memory document) public pure returns (bytes32)  {
    return sha256(document);
  }
  
  function checkDocument(string memory document) view public returns (bool) {
    **bytes32 proof = proofFor(document);**
    return hasProof(proof);
  }
  
  function hasProof(bytes32 proof) view public returns(bool) {
    return proofs[proof];
