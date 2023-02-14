function calculateSubFloor(IERC20 wrappedToken, IERC20 backingToken) public override view returns (uint256)
{
    address pair = UniswapV2Library.pairFor(address(uniswapV2Factory), address(rootKit), address(backingToken));
    uint256 freeRootKit = rootKit.totalSupply().sub(rootKit.balanceOf(pair));
    uint256 sellAllProceeds = 0;
    if (freeRootKit > 0) {
        address[] memory path = new address[](2);
        path[0] = address(rootKit);
        path[1] = address(backingToken);
        uint256[] memory amountsOut = UniswapV2Library.getAmountsOut(address(uniswapV2Factory), freeRootKit, path);
        sellAllProceeds = amountsOut[1];
    }
    uint256 backingInPool = backingToken.balanceOf(pair);
    if (backingInPool <= sellAllProceeds) { return 0; }
    uint256 excessInPool = backingInPool - sellAllProceeds;

    uint256 requiredBacking = backingToken.totalSupply().sub(excessInPool);
    uint256 currentBacking = wrappedToken.balanceOf(address(backingToken));
    if (requiredBacking >= currentBacking) { return 0; }
    return currentBacking - requiredBacking;
}
