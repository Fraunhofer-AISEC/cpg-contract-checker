function AssemblyEvent() public {
    bytes32 _id = hex"420042";
    bytes32 t1 = bytes32(uint256(123));
    bytes32 t2 = bytes32(keccak256("Deposit(address,bytes32,uint256)"));
    bytes32 t3 = bytes32(uint256(uint160(msg.sender)));
    

    assembly {
        let p := add(msize, 0x20)
        mstore(p, t1)
        log3(p, 0x20, t2, t3, _id)
    }
}
