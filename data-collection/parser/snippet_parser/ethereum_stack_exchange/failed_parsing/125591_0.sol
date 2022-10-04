 uint256 contractTokenBalance = balanceOf(address(this));
 uint256 public swapTokensAtAmount = 2500000 * (10**9);

 if(contractTokenBalance >= swapTokensAtAmount){
    
 } 



 function swapBack(uint256 tokensToLiquify) internal lockTheSwap {

   uint256 tokensToLP = tokensToLiquify.mul(SellLiquidityFee).div(SellTotalFees).div(2);
   uint256 amountToSwap = tokensToLiquify.sub(tokensToLP);

   address[] memory path = new address[](2);
   path[0] = address(this);
   path[1] = uniswapV2Router.WETH();

  _approve(address(this), address(uniswapV2Router), tokensToLiquify);
  uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
        amountToSwap,
        0,
        path,
        address(this),
        block.timestamp
 );

  uint256 bnbBalance = address(this).balance;
  uint256 bnbFeeFactor = SellTotalFees.sub(SellLiquidityFee.div(2));

  uint256 bnbForLiquidity = bnbBalance.mul(SellLiquidityFee).div(bnbFeeFactor).div(2);
  uint256 bnbForReflection = bnbBalance.mul(SellRewardsFee).div(bnbFeeFactor);
  uint256 bnbForMarketing = bnbBalance.sub(bnbForLiquidity).sub(bnbForReflection);

  addLiquidity(tokensToLP, bnbForLiquidity);

  payable(_marketingWallet).transfer(bnbForMarketing);

  (bool success,) = address(dividendTracker).call{value: bnbForReflection}("");

  if(success) {
       emit SendDividends(tokensToLiquify.mul(SellRewardsFee).div(SellTotalFees), bnbForReflection);
   }
}
