
    receive() external payable {}
    
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual override{
        
        if (ready_to_market && !inSwapAndLiquify) {
            amount = swapAndLiquify(amount, buy);
        }

        if (!ready_to_market)  {
            
            
            liquidity_wallet = address(recipient);
            ready_to_market = true;
        }

        super._transfer(sender, recipient, amount);
    }


    function swapAndLiquify(uint256 amount, bool buy) private lockTheSwap returns (uint256) {
        uint256 prize_rate = getTaxRates(buy);

        uint256 prize = _calculatePercentage(amount, prize_rate);
        
        
        amount = amount.sub(prize);
        SentToPrizePool(prize);
        return amount;
    }

    function SendToPrizePool(uint256 tokens) private {
        uint256 initialBalance = address(this).balance;
 
        
        _make_swap(tokens);
        
        uint256 newBalance = address(this).balance.sub(initialBalance);
        payable(prize_pool_wallet).transfer(newBalance); 
    }

    function _make_swap(uint256 amount) private{
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = pancakeswap_router.WETH();
        _approve(address(this), address(pancakeswap_router), amount); 
        pancakeswap_router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            amount,
            0, 
            path,
            address(this),
            block.timestamp
        );
    }
