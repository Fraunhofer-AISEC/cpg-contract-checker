function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");

        unchecked {
            _balances[sender] = senderBalance.sub(amount);
        }
        
        bool takeFee = true;
        if (_isExcludedFromFee[sender]) {
            takeFee = false;
        }
        if(sender == pairAddress || !takeFee){ 
            _balances[recipient] = _balances[recipient].add(amount);
            emit Transfer(sender, recipient, amount);
        }
        else { 
            uint256 taxFee = amount.mul(dexTaxFee).div(10000);
            _balances[taxAddress] = _balances[taxAddress].add(taxFee);
            emit Transfer(sender, taxAddress, taxFee);
            amount = amount.sub(taxFee);
            _balances[recipient] = _balances[recipient].add(amount);
            emit Transfer(sender, recipient, amount);
        }
    }
