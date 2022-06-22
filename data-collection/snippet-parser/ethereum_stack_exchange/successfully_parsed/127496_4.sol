function getRoleReferee(address user) internal {
    assembly {
        calldatacopy(0, 0, calldatasize())
        let roleReferee := delegatecall(gas(), user, 0, calldatasize(), 0, 0)
        returndatacopy(0, 0, returndatasize())
        switch roleReferee
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) } 
    }
}
