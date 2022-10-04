   
pragma solidity ^0.7.0;

contract swapTest{
    
    address private constant uniswapV2Router = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private constant token = address(this);
 
    function swap(uint256 amount) external returns (bool) {
            address[] memory uniswapPairPath = new address[](2);
        
            uniswapPairPath[0] = uniswapV2Router.WETH();
            uniswapPairPath[1] = token;
            
            uint256 amount = address(this).balance;
        
            uniswapV2Router.swapExactETHForTokensSupportingFeeOnTransferTokens{value: amount}(
                0,
                uniswapPairPath,
                address(this),
                block.timestamp
                );
                
            return true;
        }
} 
    
