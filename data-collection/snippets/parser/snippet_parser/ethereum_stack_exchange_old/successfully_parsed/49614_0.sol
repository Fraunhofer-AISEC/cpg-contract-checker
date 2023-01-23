function delegatedFwd(
    address _dst,
    bytes _calldata,
    uint256 _minReturnSize) internal {

    require(isContract(_dst));
    uint256 size;
    uint256 result;
    uint256 fwd_gas_limit = FWD_GAS_LIMIT;
    assembly {
        result := delegatecall(sub(gas, fwd_gas_limit), _dst, add(_calldata, 0x20), mload(_calldata), 0, 0)
        size := returndatasize
    }

    require(size >= _minReturnSize);

    assembly {
        let ptr := mload(0x40)
        returndatacopy(ptr, 0, size)

        
        
        switch result case 0 { revert(ptr, size) }
        default { return(ptr, size) }
    }
}
