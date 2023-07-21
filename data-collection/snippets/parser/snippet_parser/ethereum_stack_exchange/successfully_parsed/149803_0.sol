contract PancakeV3Test {
    IMasterChef public masterChef;
    INonfungiblePositionManager public nftPositionManager;

    function addLiquidity(address _token0, address _token1, uint256 _amount0, uint256 _amount1, int24 _tickLower, int24 _tickUpper, uint24 _fee) 
        public
        returns (
            uint256 tokenId,
            uint128 liquidity,
            uint256 amount0,
            uint256 amount1
        ) {
        INonfungiblePositionManager.MintParams memory params =
            INonfungiblePositionManager.MintParams({
                token0: _token0,
                token1: _token1,
                fee: _fee,
                tickLower: _tickLower,
                tickUpper: _tickUpper,
                amount0Desired: _amount0,
                amount1Desired: _amount1,
                amount0Min: _amount0 * 95 / 100,
                amount1Min: _amount1 * 95 / 100,
                recipient: address(this),
                deadline: block.timestamp + 1 hours
            });

        (tokenId, liquidity, amount0, amount1) = nftPositionManager.mint(params);

        
        nftPositionManager.safeTransferFrom(address(this), address(masterChef), tokenId);
    }
}
