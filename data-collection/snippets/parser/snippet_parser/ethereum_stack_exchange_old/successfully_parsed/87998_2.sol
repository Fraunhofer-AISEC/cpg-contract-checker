function assemblyStorage() public payable returns (string memory a){
    test = "good";
    assembly {
        let r := sload(0)
        
        let l := shr(1, and(r, 0xff))
        
        a := mload(0x40)
        
        
        mstore(0x40, add(a, add(0x20, shl(5, shr(5, add(l, 0x1f))))))
        
        mstore(a, l)
        
        mstore(add(a, 0x20), and(r, not(0xff)))
    }
}
