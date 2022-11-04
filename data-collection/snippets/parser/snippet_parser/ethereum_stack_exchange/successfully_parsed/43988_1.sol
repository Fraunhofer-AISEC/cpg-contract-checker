contract Test {
    bytes32[] hashes;

    function hash(bytes data) public pure {
        return keccak256(data);
    }

    function store(bytes32 hash) public {
        hashes.push(hash);
    }
}
