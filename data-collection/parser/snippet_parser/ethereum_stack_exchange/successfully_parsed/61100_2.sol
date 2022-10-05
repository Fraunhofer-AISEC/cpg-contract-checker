contract IPFSStorage {
    struct Multihash {
        bytes32 hash;
        bytes2 hash_function;
        uint8 size;
    }

    Multihash multihash;

    function storeCIDAsStruct(bytes32 _hash, bytes2 _hash_function, uint8 _size) public {

        Multihash memory multihashMemory;
        multihash.hash = _hash;
        multihash.hash_function = _hash_function;
        multihash.size = _size;

        multihash = multihashMemory;
    }
}
