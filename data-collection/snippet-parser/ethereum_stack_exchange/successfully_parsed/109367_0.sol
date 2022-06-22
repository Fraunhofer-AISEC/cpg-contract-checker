uint exactTokenBAmount = _tokenB.balanceOf(address(this));
_tokenA.approve(address(_router), 2 ** 256 - 1);
_tokenB.approve(address(_router), exactTokenBAmount);
_router.addLiquidity(address(_tokenA), address(_tokenB), 0, exactTokenBAmount, 0, exactTokenBAmount, address(this), block.timestamp);
