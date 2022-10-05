pragma solidity ^0.5.0;


contract ReentrancyGuard {
    
    
    uint constant private LOCK_FLAG_ADDRESS = 0x8e94fed44239eb2314ab7a406345e6c5a8f0ccedf3b600de3d004e672c33abf4; 

    function initializeReentrancyGuard () internal {
        
        
        
        
        
        
        assembly { sstore(LOCK_FLAG_ADDRESS, 1) }
    }

    
    modifier nonReentrant() {
        bool notEntered;
        assembly { notEntered := sload(LOCK_FLAG_ADDRESS) }

        
        require(notEntered, "ReentrancyGuard: reentrant call");

        
        assembly { sstore(LOCK_FLAG_ADDRESS, 0) }

        _;

        
        
        assembly { sstore(LOCK_FLAG_ADDRESS, 1) }
    }
}
