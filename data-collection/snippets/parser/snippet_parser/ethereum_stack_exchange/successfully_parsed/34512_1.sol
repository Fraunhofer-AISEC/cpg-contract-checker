function getOwner(string productId) constant returns(bytes32) {
 bytes32 trackingId = items[productId];
 ProofEntry memory record = proofs[trackingId];
 return (record.owner);}
