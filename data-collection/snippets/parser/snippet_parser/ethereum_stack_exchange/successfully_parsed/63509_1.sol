function checkProof(bytes32[] proof, bytes32 hash) view internal returns (bool) {
    bytes32 el;
    bytes32 h = hash;

    for (uint i = 0; i <= proof.length - 1; i += 1) {
        el = proof[i];

        if (h < el) {
            h = keccak256(h, el);
        } else {
            h = keccak256(el, h);
        }
    }

    return h == merkleRoot;
}
