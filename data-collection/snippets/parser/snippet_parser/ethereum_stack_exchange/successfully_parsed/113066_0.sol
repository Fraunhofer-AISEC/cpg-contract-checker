pragma solidity ^0.7.6;

contract TestArray {
    
    uint256[] abc;
    
    constructor() {
        abc.push(1);
        abc.push(2);
        abc.push(3);
        abc.push(4);
        abc.push(5); 
    }
    
    function getLength() external view returns (uint256 lgth) {
        assembly {
            let ptr := abc.slot
            lgth := sload(ptr)
        }
    }
    
    function newLength() external {
        assembly {
            let ptr := abc.slot
            sstore(abc.slot, 2)
        }
    }
    
    function getElt(uint256 idx) external view returns (uint256) {
        return abc[idx];
    }
    
    function getStorage(uint256 idx) external view returns (uint256 res) {
        assembly {
            let ptr := abc.slot
            res := sload(add(keccak256(abc.slot, 32), idx))
        }
    }
}
