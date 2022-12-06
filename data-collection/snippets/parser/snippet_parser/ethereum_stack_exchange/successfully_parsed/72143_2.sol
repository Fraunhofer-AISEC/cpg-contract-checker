function test() public view returns (uint256, uint256) {
    bool success = address(notMyContract).call(abi.encodeWithSelector(notMyContract.func.selector));
    require(success);
    uint256[2] memory ret;
    assembly {
        let size := returndatasize
        if gt(size, 64) {
            revert(0, 0)
        }
        returndatacopy(ret, 0, size)
    }
    return (ret[0], ret[1]);
}
