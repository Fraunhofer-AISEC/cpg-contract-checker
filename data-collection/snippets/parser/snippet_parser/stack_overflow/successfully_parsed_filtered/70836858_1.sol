function swapBack() internal swapping {
        uint256 contractTokenBalance = balanceOf(address(this));
        
        uint256 amountToLiquify = contractTokenBalance.mul(liquidityFee).div(totalFee).div(2); 
        uint256 amountToSwap = contractTokenBalance.sub(amountToLiquify);

        
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = WBNB;

        
        uint256 balanceBefore = address(this).balance;

        

        router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            amountToSwap, 
            0, 
            path, 
            address(this), 
            block.timestamp 
        );

        uint256 amountBNB = address(this).balance.sub(balanceBefore); 
        uint256 totalBNBFee = totalFee.sub(liquidityFee.div(2)); 
        uint256 amountBNBLiquidity = amountBNB.mul(liquidityFee).div(totalBNBFee).div(2); 
        uint256 amountBNBMarketing = amountBNB.mul(marketingFee).div(totalBNBFee);

        
        (bool MarketingSuccess, ) = payable(marketingFeeReceiver).call{value: amountBNBMarketing, gas: 30000}("");
        require(MarketingSuccess, "receiver rejected ETH transfer");

        
        if(amountToLiquify > 0){
            router.addLiquidityETH{value: amountBNBLiquidity}(
                address(this),
                amountToLiquify,
                0,
                0,
                marketingFeeReceiver,
                block.timestamp
            );
            emit AutoLiquify(amountBNBLiquidity, amountToLiquify);
        }
    }
