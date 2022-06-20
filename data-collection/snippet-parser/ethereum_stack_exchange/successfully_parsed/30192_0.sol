contract C {
function f(uint a, uint b) constant returns (uint[]) {
    assembly {
        
        let memOffset := mload(0x40) 
        mstore(memOffset, 0x20) 
        mstore(add(memOffset, 32), 2) 
        mstore(add(memOffset, 64), a) 
        mstore(add(memOffset, 96), b) 
        return(memOffset, 128)
    }
}
}