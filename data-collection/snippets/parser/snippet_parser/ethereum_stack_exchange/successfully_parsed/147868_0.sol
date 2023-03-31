function execute(
    
    address r,
    uint256 v,
    bytes memory d
    ) private {
   
    assembly {
        let success_ := call(gas(), r, v, add(d, 0x00), mload(d), 0x20, 0x0)
        let success := eq(success_, 0x1)
        if iszero(success) {
            revert(mload(d), add(d, 0x20))
        }
    }
}
