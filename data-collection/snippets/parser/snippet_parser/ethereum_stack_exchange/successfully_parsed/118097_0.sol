 uint liquidity = IERC20(LPADDRESS).balanceOf(address(this));
      IERC20(LPADDRESS).approve(XXX, liquidity);

 IRouter(XXX).removeLiquidity(token1, token2, liquidity, 1, 1, address(this), deadline);

