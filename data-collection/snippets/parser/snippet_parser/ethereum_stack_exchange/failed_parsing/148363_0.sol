    function _transfer(address from, address to, uint256 amount) internal override {

    require(from != address(0), "ERC20: transfer from the zero address");
    require(to != address(0), "ERC20: transfer to the zero address");
    require(amount > 0, "amount must be greater than 0");
               

        if (from != owner() && to != owner() && to != address(0) && to != address(0xdead)){
            if(!tradingActive){
                require(_isExcludedFromFees[from] || _isExcludedFromFees[to], "Trading is not active.");
            }
                        
            
            if (automatedMarketMakerPairs[from] && !_isExcludedMaxTransactionAmount[to]) {

                    require((balanceOf(to) + amount) <= maxWallet, "Cannot Exceed max wallet");
            } 
            
            else if (automatedMarketMakerPairs[to] && !_isExcludedMaxTransactionAmount[from]) {

            } 
            else if (!_isExcludedMaxTransactionAmount[to] && !_isExcludedMaxTransactionAmount[from]){
            
            }
        }
