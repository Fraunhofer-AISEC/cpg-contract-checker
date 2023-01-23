function concatenate(bytes16 _a, bytes16 _b) public pure returns (bytes32) {
    assembly {
        let ptr := mload(0x40)

        mstore(ptr,_a)
        mstore(add(ptr,0x10),_b)

        return(ptr,0x20)
    }
}
