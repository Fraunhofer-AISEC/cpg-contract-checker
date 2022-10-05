function test() public view returns (uint256, uint256) {
    (bool success, bytes memory returnValue) = address(notMyContract).staticcall(
        abi.encodeWithSelector(notMyContract.func.selector));

    require(success, "Call failed.");

    if (returnValue.length > 32) {
        return abi.decode(returnValue, (uint256, uint256));
    }
    else {
        uint256 a = abi.decode(returnValue, (uint256));
        return (a, 0);
    }
}
