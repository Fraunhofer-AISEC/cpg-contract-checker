IQuoter iQuoter = IQuoter(0xb27308f9F90D607463bb33eA1BeBb41C27CE5AB6); 

address sellingAddress = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599; 
address wethAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
uint24 poolFee = 3000;
uint amountIn = 2962367;
uint160 sqrtPriceLimit = 0;


uint tokenOutput = iQuoter.quoteExactInputSingle(wethAddress, sellingAddress, poolFee, amountIn, sqrtPriceLimit);
