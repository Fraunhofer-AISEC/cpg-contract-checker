function () payable external {
    address impl = methodsImplementations[msg.sig];
    require(impl != address(0x00), "Method not found. 404");
    
    assembly {
        let p := mload(0x40)
        calldatacopy(p, 0x00, calldatasize)
        let result := delegatecall(gas, impl, p, calldatasize, 0x00, 0x00)
        let size := returndatasize
        returndatacopy(p, 0x00, size)
        
        switch result
        case 0x00 { revert(p, size) }
        default { return(p, size) }
    }
}
