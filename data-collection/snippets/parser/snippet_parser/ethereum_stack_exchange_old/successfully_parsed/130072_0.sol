pragma solidity ^0.8.4;

contract AssemblyTest {

    function working() external view returns (bytes memory res) {
        assembly {
            res := mload(0x40)           
            mstore(res, 0x40)            
            mstore(add(res, 0x20), 1)    
            mstore(add(res, 0x40), 2)    
            mstore(0x40, add(res, 0x60)) 
        }
    }

    function notWorking() external view returns (bytes memory) {
        assembly {
            let res := mload(0x40)       
            mstore(res, 0x40)            
            mstore(add(res, 0x20), 1)    
            mstore(add(res, 0x40), 2)    
            mstore(0x40, add(res, 0x60)) 
            return (res, 0x60)           
        }
    }
}
