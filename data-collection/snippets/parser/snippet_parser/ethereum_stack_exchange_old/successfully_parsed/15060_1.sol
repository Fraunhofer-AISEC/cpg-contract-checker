contract StorageMapping {

    struct S {
        mapping(bytes32 => uint) m;
        bytes32[] b;
        
    }

    mapping(bytes32 => S) public sStructs;

}
