function sellDai(uint256 daiQty , address cryptoToken) public payable returns(uint256){



  uint256 ethAmountDerivable = getEstimatedTokenForETH(daiQty , cryptoToken)[0];
  ethAmountDerivable = ethAmountDerivable.mul(10).div(11);
 
  uint deadline = now + 300; 

  IERC20 dai = IERC20(cryptoToken);
  dai.approve(address(this), 0);
  dai.approve(address(this), daiQty);

    usi.swapExactTokensForETH(daiQty , ethAmountDerivable, getPathForTokenToETH(cryptoToken), address(this), deadline);

   return ethAmountDerivable;

}
