

pragma solidity =0.6.6;

import '@uniswap/v2-core/contracts/interfaces/IUniswapV2Callee.sol';
import './interfaces/IUniswapV2Factory.sol';
import './interfaces/IUniswapV2Router01.sol';
import './interfaces/IERC20.sol';
import './libraries/UniswapV2Library.sol';
import './interfaces/IPancakeCallee.sol';

contract FlashSwap is IPancakeCallee {
    
    address factory;
    IUniswapV2Router01 router;
    uint deadline;
   
    
    
    
    function startSwap (address _factory, address _router, address _token0, address _token1, uint _amountToken0, uint _amountToken1,  uint _deadline) external {
        factory = _factory;
        router =  IUniswapV2Router01(_router);
        deadline = _deadline;
        address pairAddress = IUniswapV2Factory(factory).getPair(_token0, _token1);
        
        IUniswapV2Pair(pairAddress).swap(
            _amountToken0,
            _amountToken1,
            address(this),
            bytes('not empty')
        );
        
    }
    
    function pancakeCall(address sender, uint amount0, uint amount1, bytes calldata data) external override {
        
      
        address[] memory path = new address[](2);
        uint amountToken = amount0 == 0 ? amount1 : amount0;
    
        address token0 = IUniswapV2Pair(msg.sender).token0();
        address token1 = IUniswapV2Pair(msg.sender).token1();
        
        assert(msg.sender == UniswapV2Library.pairFor(factory, token0, token1)); 
        assert(amount0 == 0 || amount1 == 0); 
        
        path[0] = amount0 == 0 ? token1 : token0;
        path[1] = amount0 == 0 ? token0 : token1;
        
        IERC20 token = IERC20( amount0 == 0 ? token1 : token0 );
        IERC20 otherToken = IERC20( amount0 == 0 ? token0 : token1);
        
        token.approve(address(router), amountToken);
        
        
        uint amountRequired = UniswapV2Library.getAmountsOut(
            factory,
            amountToken,
            path
        )[1];
        
        uint amountReceived = router.swapExactTokensForTokens(
            amountToken,
            amountRequired,
            path,
            address(this),
            deadline
        )[1];
        
        require(amountReceived > amountRequired, 'amountReceived < amountRequired');
        
        otherToken.transfer(msg.sender, amountRequired);
        otherToken.transfer(tx.origin, amountReceived - amountRequired);
    }
    
}```
