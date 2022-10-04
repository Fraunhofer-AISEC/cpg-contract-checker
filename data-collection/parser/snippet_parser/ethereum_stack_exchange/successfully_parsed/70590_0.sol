uint id  = 1;
    struct Multihash {
        bytes32 digest;
        uint8 hashFunction;
        uint8 size;
    }
    mapping (uint => Multihash) private ipfsHashes;

    function addFile(bytes32 _digest, uint8 _hashFunction, uint8 _size) external {
        Multihash memory entry = Multihash(_digest, _hashFunction, _size);
        ipfsHashes[id] = entry;
        id = id + 1;
    }
