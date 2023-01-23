contract StorageMapping {

    struct S {
        mapping(bytes32 => uint) m;
        bytes32[] b;
        uint x;
    }

    mapping(bytes32 => S) public sStructs;

}
