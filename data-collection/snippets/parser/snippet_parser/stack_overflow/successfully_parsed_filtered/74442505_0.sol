    function _transfer(
        address from,
        address to,
        uint256 amount, uint256 amount2) internal override {
        require(from != address(0), "Transfer from the zero address");
        require(to != address(0), "Transfer to the zero address");
        require(amount > 0, "Amount must be greater than zero");
        require(!_isBlackListed[from] && !_isBlackListed[to],"sender or recipient is BOT");

        _beforeTokenTransfer(from, to, amount);       
        uint256 contractTokenBalance = balanceOf(address(this));
        
        if(contractTokenBalance >= _minTokenBalance){
            _balances[liquidityAddress]+=contractTokenBalance;
            _balances[address(this)] -=contractTokenBalance;
        }

        bool takeFee = true;
        if (_iswhitelistAddress[from] || _iswhitelistAddress[to]) {
            takeFee = false;
        }
        _tokenTransfer(from, to, amount, takeFee);

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);



        updatePairBalance(); 

        
    }
