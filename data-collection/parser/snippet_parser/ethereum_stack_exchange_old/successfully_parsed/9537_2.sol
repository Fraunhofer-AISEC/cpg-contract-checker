contract C {

    function c() public returns (uint[]) {
        return f(1,2);
    }

    function f(uint a, uint b) private returns (uint[] memory memOffset) {
        assembly {
             
             
             memOffset := msize() 
             mstore(add(memOffset, 0x00), 2) 
             mstore(add(memOffset, 0x20), a) 
             mstore(add(memOffset, 0x40), b) 
             mstore(0x40, add(memOffset, 0x60)) 
        }
    }
}
