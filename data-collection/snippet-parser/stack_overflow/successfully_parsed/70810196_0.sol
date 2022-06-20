
    address constant public BUSD = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;

    IPancakeRouter02 _pancakeRouter = IPancakeRouter02(_pancakeRouterAddress);
    
    pancakePair = IPancakeFactory(_pancakeRouter.factory()).createPair(address(this), BUSD);
    
    pancakeRouter = _pancakeRouter;

function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {
        
        uint256 totalFees = _buyLiquidityFee + _sellLiquidityFee + _buyMarketingFee + _sellMarketingFee + _buyWhaleBuybackFee + _sellWhaleBuybackFee;

        uint256 _totalMarketingFee = _buyMarketingFee + _sellMarketingFee;
        uint256 marketingPercent = _totalMarketingFee.div(totalFees);
        uint256 marketingQuota = marketingPercent.mul(contractTokenBalance);

        uint256 _totalWhaleBuybackFee = _buyWhaleBuybackFee + _sellWhaleBuybackFee;
        uint256 whaleBuybackPercent = _totalWhaleBuybackFee.div(totalFees);
        uint256 whaleBuybackQuota = whaleBuybackPercent.mul(contractTokenBalance);        
        
        
        
        
        
        uint256 initialBalance = address(this).balance;     
        swapTokensForBNB(marketingQuota); 
        swapBNBForBUSD(address(this).balance);
        transferOutBUSD(marketingWallet, address(this).balance.sub(initialBalance));
        
        

        uint256 initialBalance2 = address(this).balance;     
        swapTokensForBNB(whaleBuybackQuota); 
        transferOutBUSD(whaleBuybackWallet, address(this).balance.sub(initialBalance2));
        
        


        
        uint256 initialBalanceAfterUtility = address(this).balance;
        uint256 half = initialBalanceAfterUtility.div(2);
        uint256 otherHalf = initialBalanceAfterUtility.sub(half);

        swapTokensForBNB(half);
        swapBNBForBUSD(address(this).balance); 
        uint256 newBalance = address(this).balance.sub(initialBalanceAfterUtility);
        addLiquidity(otherHalf, newBalance);

        emit SwapAndLiquify(half, newBalance, otherHalf);
    }

    function swapTokensForBNB(uint256 tokenAmount) private {
        
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = pancakeRouter.WETH();

        _approve(address(this), address(pancakeRouter), tokenAmount);

        
        pancakeRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, 
            path,
            address(this),
            block.timestamp
        );
    }

    function transferOutBNB(address payable recipient, uint256 amount) private {
        recipient.transfer(amount);
    }

    function swapBNBForBUSD(uint256 tokenAmount) private{

        _approve(address(this), address(pancakeRouter), tokenAmount);

        address[] memory path = new address[](2);
        path[0] = pancakeRouter.WETH();
        path[1] = BUSD;  

        pancakeRouter.swapExactETHForTokensSupportingFeeOnTransferTokens(
            tokenAmount, 
            path, 
            address(this), 
            block.timestamp
            );
    }

    function transferOutBUSD(address payable recipient, uint256 amount) private{
        recipient.transfer(amount);
    }

    function addLiquidity(uint256 tokenAmount, uint256 bnbAmount) private {
        
        _approve(address(this), address(pancakeRouter), tokenAmount);

        
        pancakeRouter.addLiquidity( 
            address(this),
            BUSD,
            tokenAmount,
            bnbAmount,
            0, 
            0, 
            owner(), 
            block.timestamp
        );
    }
