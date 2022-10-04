function getLiquidityFromPositionManager(uint256 tokenId) private view returns (uint128) {
    INonfungiblePositionManager manager = INonfungiblePositionManager(msg.sender);
    (
        ,
        ,
        ,
        ,
        ,
        ,
        ,
        uint128 liquidity,
        ,
        ,
        ,
        
    ) = manager.positions(tokenId);
    return liquidity;
}
