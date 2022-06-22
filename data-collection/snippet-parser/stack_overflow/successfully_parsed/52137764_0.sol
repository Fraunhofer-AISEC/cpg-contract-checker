function getHashs(string id) public view returns (bytes32[]) {
    bytes32[] memory stringsToHash = getStrings(id);
    bytes32[] memory hashes = new bytes32[](5);

    for(uint i=0; i<=stringsToHash.length-1; i++) {
        bytes32 str = seeds[i];
        bytes32 hash = sha256(abi.encodePacked(seed));
        hashes[i] = hash;
    }

    return hashes;
}
