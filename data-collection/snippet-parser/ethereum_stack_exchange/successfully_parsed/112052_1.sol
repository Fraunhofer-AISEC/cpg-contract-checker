function transfer(address recipient, uint256 amount) 
        initialTransferCheck_(recipient, amount)  
        public override returns (bool) {
        
        uint256 TxAmount;
        TxAmount = _calculateAndCollectFee(amount);
            
        move(_msgSender(), recipient, TxAmount);
        emit Transfer(_msgSender(), recipient, TxAmount);
        
        rankingUpdate(_msgSender(), recipient);
        return true;
    }
