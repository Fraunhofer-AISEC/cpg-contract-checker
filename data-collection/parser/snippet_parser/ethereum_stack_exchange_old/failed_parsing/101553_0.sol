function insert(bytes32 key1, address key2, string memory data) public {
    Dataset storage d = new Dataset(d);
    m1[key1] = d;
    m2[key2] = d;
    ...
