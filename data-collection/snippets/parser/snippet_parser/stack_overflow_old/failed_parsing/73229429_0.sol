for (uint256 i = 0; i < implementations.length; ++i) {
    address implementation = implementations[i];
    assembly {
        
        
        
        calldatacopy(0, 0, calldatasize())

        
        
        let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)

        
        returndatacopy(0, 0, returndatasize())

        switch result
        
        case 0 {
            
            
        }
        default {
            return(0, returndatasize())
        }
    }
}

revert("NO_SUCH_FUNCTION");
