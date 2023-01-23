    function _delegate(address implementation) internal {
        
        assembly {
        
        
        
            calldatacopy(0, 0, calldatasize())

        
        
            let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)

        
            returndatacopy(0, 0, returndatasize())

            switch result
            
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }
    fallback () external {
        _delegate(delegationTarget);
    }
