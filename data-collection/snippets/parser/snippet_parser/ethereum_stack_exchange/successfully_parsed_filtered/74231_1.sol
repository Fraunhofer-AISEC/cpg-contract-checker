function(uint256 id, string memory uri,bytes v, bytes32 r, bytes32 s){
  digest = keccak256(abi.encodePacked(id, uri));
  signer = ecrecover(digest, v, r, s);
}
