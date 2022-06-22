contract C {
    function f(uint a, uint b) pure public returns (uint[] memory memOffset) {
        assembly {
             
             
             memOffset := msize() 
             mstore(add(memOffset, 0x00), 2) 
             mstore(add(memOffset, 0x20), a) 
             mstore(add(memOffset, 0x40), b) 
             mstore(0x40, add(memOffset, 0x60)) 
        }
    }

    function get_f(uint a, uint b) public returns(uint){
        uint[] memory ret = f(a,b);
        return ret[0];
    }
}
