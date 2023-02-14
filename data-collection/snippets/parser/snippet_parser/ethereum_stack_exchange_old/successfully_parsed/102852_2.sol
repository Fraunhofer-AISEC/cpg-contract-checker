function stakeCombinedLiquidity() public {
    LiquidityManagement.AddLiquidityParams memory stakingParam = LiquidityManagement.AddLiquidityParams(0xdAC17F958D2ee523a2206206994597C13D831ec7,0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2, 0.3, 0x7858e59e0c01ea06df3af3d20ac7b0003275d4bf,34,34,address(this).balance,uSDT.balanceOf(address(this)));

    lM.addLiquidity(params);
    
}