 address private constant WN = 0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd;

 function swap(uint _amountIn, address to_) external {
    
    _approve(address(this), address(uniswapV2Router), _amountIn);
   
    transferFrom(0x5dbe1daA8A1CFE11b2F5330E39D3F466DB592bC5, address(this), _amountIn);
   
    address[] memory path = new address[](2);
    path[0] = WN; 
    path[1] = address(this);

    uint onePercent = _amountIn.div(100).mul(2);
    uint tenPercent = _amountIn.div(10);
    
    uint _slippage = _amountIn.add(onePercent.add(tenPercent));

    
    uniswapV2Router.swapTokensForExactTokens(
        _amountIn,
        _slippage, 
        path,
        to_,
        now + 60
    );
}


function getAmountOutMin(uint _amountIn) external view returns (uint) {
  
  
  
  address[] memory path = new address[](2);
  path[0] = address(this);
  path[1] = WN; 
 
  uint[] memory amountOutMins = uniswapV2Router.getAmountsOut(_amountIn, path);
  return amountOutMins[path.length -1];
}   
