function buyToken() public payable returns (uint[] memory amounts) {
            require(address(_quoteToken) != address(0), "Quote Token should not be zero address");
    
            address [] memory path = new address[](2);
            path[0] = address(_weth);
            path[1] = address(_quoteToken);
    
            uniswapV2Router.swapExactETHForTokensSupportingFeeOnTransferTokens{value: msg.value}(
                0,
                path,
                address(this),
                block.timestamp + 1000
            );
            return(amounts);
           emit Swapped(msg.value);
        }
