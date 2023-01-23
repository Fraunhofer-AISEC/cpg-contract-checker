

function hasProof(bytes32 proof) constant returns (bool) {
for (uint256 i = 0; i < proofs.length; i++) {
    if (proofs[i] == proof) {
        return true;
    }
}
return false;
}
