pragma solidity^0.4.11;

contract C {
    function testRevert() pure public returns (uint result) {
        uint memOffset;
        assembly {
             memOffset := msize() 
             mstore(add(memOffset, 0x00), 6) 
             mstore(0x40, add(memOffset, 0x20)) 
             revert(memOffset, 0x20) 
        }
    }
}
