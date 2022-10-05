pragma solidity ^0.4.0;

contract AssemblyArray {

    function getFirstArray(bytes _array) 
        public
        returns (uint[]) {
        assembly {
            
            let ptr := msize()
            
            let size := mload(add(_array, 0x40)) 
            
            let offset := 0x60
            
            let idx := 0

            
            mstore(ptr, 0x20)
             
            mstore(add(ptr,0x20), size)

            
            jumpi(_ret, eq(0, size))

            _add:
            
            mstore(add(ptr,add(0x40,mul(0x20,idx))), mload(add(offset, mul(0x20, idx))) )

            
            idx := add(idx, 1)
            
            jumpi(_add, lt(idx, size))

            _ret:
            return(ptr, mul(add(size, 2), 0x20))
        }    
    }
}
