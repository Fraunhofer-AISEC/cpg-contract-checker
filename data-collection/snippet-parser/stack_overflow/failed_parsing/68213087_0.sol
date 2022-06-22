pragma solidity >=0.6.0 <0.7.0; 






 contract unisimple {
  event unirouterAddress(address);
  event suishirouterAddress(address);
       using SafeMath for uint256; 
       address immutable factory;
       
       IUniswapV2Router01  public immutable  sushirouter ; 
 
    
      uint deadline;
  
  


    constructor(address _factory,IUniswapV2Router01 sushirouter_ ) public {
       factory = _factory;  
         sushirouter  =    IUniswapV2Router01(address(sushirouter_));
         emit suishirouterAddress(address(sushirouter_));
        deadline = block.timestamp + 300; 

    }  

    function arbitrage(address tokenin , address tokenout, uint Tradeamount) public {
        address[] memory  path = new address[](2);
        path[0] = tokenin ;
        path[1] =  tokenout ; 
       
        IERC20 TOKEN0_ERC20 = IERC20(tokenin); 
     
        TOKEN0_ERC20.approve(address(sushirouter),Tradeamount); 

uint amountRequired = sushirouter.getAmounsIn(Tradeamount, path)[0]; =
sushirouter.swapExactTokensForTokens(Tradeamount,  amountRequired  , path, address(this), deadline ); 

    }

    }
