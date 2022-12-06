pragma solidity ^0.8;

interface Storage {
    
    function init() external;

    
}

contract Factory {
    function createStorage() external returns (address target) {
        
        address target = createMinimalProxy(address(0x123));
        
        Storage(target).init();
    }

    function createMinimalProxy(address _implementation) internal returns (address result) {
        bytes20 implementationBytes = bytes20(_implementation);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
            mstore(add(clone, 0x14), implementationBytes)
            mstore(add(clone, 0x28), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
            result := create(0, clone, 0x37)
        }
    }
}
