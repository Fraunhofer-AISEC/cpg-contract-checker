fallback() external {
    bytes4 sig;
    assembly { sig := calldataload(0) }
    uint len = _sizes[sig];
    address target = _dest;

    assembly {
        calldatacopy(0x0, 0x0, calldatasize())
        let result := delegatecall(sub(gas(), 10000), target, 0x0, calldatasize(), 0, len)
        return(0, len) 
    }
}
