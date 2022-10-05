    function sellLogic() public {
        require(StopOrder != 0 || LimitOrder != 0, "stop order or LimitOrder are 0!");

       
        
       
        if (price >= LimitOrder){
            sell = true;
            

        }
        else if (price == StopOrder){
            executeOrder;
            
        }
        else {
            sell = false;
        }
}

 function executeOrder(uint orderId) external returns (uint[] memory) {
            sellLogic(); 

            Order memory order = orderBook[orderId];  
            require(sell == true, "Price is lower than your limit order,or stop order didnt got reached");
            require(order.traderAddress != address(0), "Invalid order");
            require(order.orderState == OrderState.Created, 'Invalid order state');
        
            updateOrder(order, OrderState.Finished);
    
            address[] memory pair = new address[](2);
            pair[0] = order.assetIn;
            pair[1] = order.assetOut;

            uint[] memory swapResult;
        
            if (order.orderType == OrderType.EthForTokens) {
                swapResult = uniswapV2Router.swapExactETHForTokens{value:order.assetInOffered}(order.assetOutExpected, pair, order.traderAddress, block.timestamp);
                TransferHelper.safeTransferETH(stakeAddress, order.stake.mul(STAKE_PERCENTAGE).div(100));
                TransferHelper.safeTransferETH(owAddress, order.stake.mul(100-STAKE_PERCENTAGE).div(100));
                    
            } 
            else if (order.orderType == OrderType.TokensForEth) {
                TransferHelper.safeApprove(order.assetIn, address(uniswapV2Router), order.assetInOffered);
                swapResult = uniswapV2Router.swapExactTokensForETH(order.assetInOffered, order.assetOutExpected, pair, order.traderAddress, block.timestamp);
                }
            
            else if (order.orderType == OrderType.TokensForTokens) {
                TransferHelper.safeApprove(order.assetIn, address(uniswapV2Router), order.assetInOffered);
                swapResult = uniswapV2Router.swapExactTokensForTokens(order.assetInOffered, order.assetOutExpected, pair, order.traderAddress, block.timestamp);
                }
        
            TransferHelper.safeTransferETH(msg.sender, order.executorFee);
            emit logOrderExecuted(order.id, msg.sender, swapResult);
        
            return swapResult;
        
        
        
    }
