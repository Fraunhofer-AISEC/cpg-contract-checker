
function balance0() private view returns (uint256) {
    (bool success, bytes memory data) =
        token0.staticcall(abi.encodeWithSelector(IERC20Minimal.balanceOf.selector, address(this)));
    require(success && data.length >= 32);
    return abi.decode(data, (uint256));
}
