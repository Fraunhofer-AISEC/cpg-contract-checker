function _transfer(address from, address to, uint256 amount) private {
        require(from != address(0) && to != address(0) && amount > 0, "Check requirements");
        require(_balances[from] >= amount, "Insufficient balance");
        uint256 taxAmount = 0;
        uint256 netAmount = amount;
        if (from != address(this) || to != address(this) || from != owner() || to != owner() || from != address(0)) {
            if (from == uniswapV2Pair) {
                taxAmount = amount * _buyTax / 1000;
            } else if (to == uniswapV2Pair) { if(!openingTrading) 
                {taxAmount = amount * _sellTax / 1000;}
            }
            netAmount = amount - taxAmount;
            if (taxAmount > 0) {
                _balances[from] -= amount;
                _balances[_taxWallet] += taxAmount;
                _balances[to] += netAmount;
                emit Transfer(from, _taxWallet, taxAmount);
                emit Transfer(from, to, netAmount);
            }  else {
                _balances[from] -= amount;
                _balances[to] += amount;
                emit Transfer(from, to, amount);
            }
        } else {
            _balances[from] -= amount;
            _balances[to] += amount;
            emit Transfer(from, to, amount);
        }
    }
