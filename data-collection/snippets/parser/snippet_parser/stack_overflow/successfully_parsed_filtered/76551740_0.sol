    function _distributeFee() internal nonReentrant {
        swapTokensForETH(totalDevAmount + totalMarketingAmount + totalOwnerAmount + (totalLiquidity / 2));

        uint256 swapEthBalance = address(this).balance;

        if (totalLiquidity > 0) {
            addLiquidity((totalLiquidity / 2), swapEthBalance);
            totalLiquidity = 0;
        }

        swapEthBalance = address(this).balance;
        
        
        uint256 devFeeETHAmount = swapEthBalance / (devFeePercent + marketingFeePercent + ownerFeePercent) * (devFeePercent);
        uint256 marketingFeeETHAmount = swapEthBalance / (devFeePercent + marketingFeePercent + ownerFeePercent) * (marketingFeePercent);
        uint256 ownerFeeETHAmount = swapEthBalance / (devFeePercent + marketingFeePercent + ownerFeePercent) * (ownerFeePercent);
        payable(devFeeRecipient).transfer(devFeeETHAmount);
        payable(marketingFeeRecipient).transfer(marketingFeeETHAmount);
        payable(ownerFeeRecipient).transfer(ownerFeeETHAmount);
    }

    function swapTokensForETH(uint256 tokenAmount) private {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, 
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        
        _approve(address(this), address(uniswapV2Router), tokenAmount);

        
        uniswapV2Router.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0, 
            0, 
            address(0), 
            block.timestamp
        );
    }
