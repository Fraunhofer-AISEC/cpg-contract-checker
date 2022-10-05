    
    function _transfer(address sender, address recipient, uint256 amount) internal virtual override antiWhale(sender, recipient, amount) {
        
        uint256 sendAmount = amount;
        
        
        if(lpToken != address(0) && msg.sender == lpToken && recipient != PCSRouter){
            
            uint256 buyFeeAmount = amount.mul(maxBuyFee).div(10000);
            sendAmount = amount.sub(buyFeeAmount);
            require(amount == sendAmount.add(buyFeeAmount), "UFF::transfer: Buy value invalid");
            super._transfer(sender, team, buyFeeAmount);
        }


        
        if(lpToken != address(0) && recipient == lpToken && msg.sender != PCSRouter){
            uint256 sellFeeAmount = amount.mul(maxSellFee).div(10000);
            sendAmount = amount.sub(sellFeeAmount);
            require(amount == sendAmount.add(sellFeeAmount), "UFF::transfer: Sell value invalid");
            super._transfer(sender, team, sellFeeAmount);
        }
        
        
        super._transfer(sender, recipient, sendAmount);
    }
