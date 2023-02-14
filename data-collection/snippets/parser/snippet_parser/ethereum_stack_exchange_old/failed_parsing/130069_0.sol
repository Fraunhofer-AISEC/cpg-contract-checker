
address[] memory path;
path[0] = token18Dec; 
path[1] = token9Dec; 
amounts = uniswapRouter.getAmountsOut(ethBudget, path)[1];


address[] memory path;
path[0] = token9Dec; 
path[1] = token18Dec; 
amounts = uniswapRouter.getAmountsOut(daiTokenBalance, path)[1];
