function sendBNBToCharity(uint256 amount) private { 
    swapTokensForEth(amount); 
    _charityWalletAddress.transfer(address(this).balance); 
}

function _setCharityWallet(address payable charityWalletAddress) external onlyOwner() {
    _charityWalletAddress = charityWalletAddress;
}

function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {
    
    uint256 halfOfLiquify = contractTokenBalance.div(4);
    uint256 otherHalfOfLiquify = contractTokenBalance.div(4);
    uint256 portionForFees = contractTokenBalance.sub(halfOfLiquify).sub(otherHalfOfLiquify);

    
    
    
    
    uint256 initialBalance = address(this).balance;

    
    swapTokensForEth(halfOfLiquify); 
    swapTokensForEth(portionForFees);
    
    uint256 newBalance = address(this).balance.sub(initialBalance);

    
    addLiquidity(otherHalfOfLiquify, newBalance);
    sendBNBToCharity(portionForFees);
    
    emit SwapAndLiquify(halfOfLiquify, newBalance, otherHalfOfLiquify);
}

function swapTokensForEth(uint256 tokenAmount) private {
    
    address[] memory path = new address[](2);
    path[0] = address(this);
    path[1] = uniswapV2Router.WETH();

    _approve(address(this), address(uniswapV2Router), tokenAmount);

    
    uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
        tokenAmount,
        0, 
        path,
        address(this),
        block.timestamp
    );
}
