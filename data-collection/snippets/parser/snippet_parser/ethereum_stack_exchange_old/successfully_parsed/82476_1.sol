bytes4 private constant MY_FUNC_SELECTOR = bytes4(uint256(keccak256("myFunc(address,uint256)") >> (256 - 4 * 8)));

function callMyFunc(address dest, address x, uint256 y) public view returns (uint256) {
    uint256[1] memory ret;
    bytes memory data = abi.encodeWithSelector(MY_FUNC_SELECTOR, x, y);

    assembly {
        let success := staticcall(
            gas,           
            dest,          
            add(data, 32), 
            mload(data),   
            ret,           
            32             
        )
        if iszero(success) {
            revert(0, 0)
        }
    }

    return ret[0];
}
