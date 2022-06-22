function _transferStandard(address sender, address recipient, uint256 amount)internal virtual {

        uint256 fee = (amount/100) * TX_FEE;
        

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");

        unchecked {
            _balances[sender] = senderBalance - amount;
        }

        _balances[recipient] += (amount - fee);
        _balances[address(this)] += fee;
        
        emit Transfer(sender, recipient, (amount - fee));
        
        convertFeeToEth(fee);

    }

function convertFeeToEth(uint256 amount) internal virtual{
    
    address[] memory path = new address[](2);
    path[0] = address(this);
    path[1] = uniswapV2Router.WETH();

    _approve(address(this), address(uniswapV2Router), amount);

    uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
        amount,
        0, 
        path,
        CharityWallet,
        block.timestamp
    );
    
}
