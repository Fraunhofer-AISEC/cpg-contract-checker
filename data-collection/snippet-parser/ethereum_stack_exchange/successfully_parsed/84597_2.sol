bytes4 private constant FUNC_SELECTOR = bytes4(keccak256("getReserveData(address)"));

function getAvailableLiquidity(ILendingPool _lendingPool) internal view returns (uint256) {
    uint256[2] memory ret;
    bytes memory data = abi.encodeWithSelector(FUNC_SELECTOR, RAW_ETH_ASSET);

    assembly {
        let success := staticcall(
            gas,           
            _lendingPool,  
            add(data, 32), 
            mload(data),   
            ret,           
            64             
        )
        if iszero(success) {
            revert(0, 0)
        }
    }

    return ret[1];
}
