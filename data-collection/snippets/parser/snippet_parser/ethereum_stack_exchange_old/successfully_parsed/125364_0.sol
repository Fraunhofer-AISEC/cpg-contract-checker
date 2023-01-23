function _transfer(address from, address to, uint256 amount) private {

        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");

        bool  chargeTax = true;
    
        if (from != owner() && to != owner() && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {
            require(tradeAllowed);
            require(!_isBlacklisted[from] && !_isBlacklisted[to]);

            
            if (from == pancakeswapPair && to != address(pancakeV2Router)) {
                if (limitTX) {
                    require(amount <= _maxTxAmount);
                }
                
                chargeTax = buyFeeEnabled;
                setBuyFeeOnTrancation();
                

                uint contractETHBalance = address(this).balance;
                if (contractETHBalance > 0) {
                    swapETHfortargetToken(address(this).balance);
                }
            }

            
            if(to == address(pancakeswapPair) || to == address(pancakeV2Router) ) {
                
                chargeTax = sellFeeEnabled;
                setSellFeeOnTrancation();

                uint contractTokenBalance = balanceOf(address(this));
                if (!inSwap && from != pancakeswapPair && swapEnabled) {
                    if (limitTX) {
                    require(amount <= balanceOf(pancakeswapPair).mul(3).div(100) && amount <= _maxTxAmount);
                    }
                    uint initialETHBalance = address(this).balance;

                    swapTokensForEth(contractTokenBalance);
                    
                    uint newETHBalance = address(this).balance;
                    uint ethToDistribute = newETHBalance.sub(initialETHBalance);
                    if (ethToDistribute > 0) {
                        distributeETH(ethToDistribute);
                    }
                }
                chargeTax = sellFeeEnabled;
                setSellFeeOnTrancation();

            }
        }
    
        
        
        bool takeFee = true;

        if (_isExcludedFromFee[from] || _isExcludedFromFee[to] || !feeEnabled || !chargeTax) {
            takeFee = false;
        }
        _tokenTransfer(from, to, amount, takeFee);
        removeAllFee;
    }
