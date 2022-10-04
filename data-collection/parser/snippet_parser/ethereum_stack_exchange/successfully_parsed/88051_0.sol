ufixed8x2 profit = 0;
uint256 amount = 5000000; 
 uint256 constant private PERCENT_DIVIDER = 1; 

profit= ufixed8x2(amount.div(24).div(60).div(60).mul(PERCENT_DIVIDER).div(100));
