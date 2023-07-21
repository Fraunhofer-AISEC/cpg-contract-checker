function _transfer(
    address sender,
    address recipient,
    uint256 amount
) private {
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");
    require(amount > 0, "Transfer amount must be greater than zero");

    bool takeFee = true;

    if (_isExcludedFromFee[sender] || _isExcludedFromFee[recipient]) {
        takeFee = false;
    }
    _tokenTransfer(sender, recipient, amount, takeFee);
}

function _tokenTransfer(
    address sender,
    address recipient,
    uint256 amount,
    bool takeFee
) private {
    if (!takeFee) removeAllFee();
    (
        uint256 rAmount,
        uint256 rTransferAmount,
        uint256 rFee,
        uint256 tTransferAmount,
        uint256 tFee
    ) = _getValues(amount);

    _tOwned[sender] = _tOwned[sender] - (amount);
    _rOwned[sender] = _rOwned[sender] - (rAmount);
    _tOwned[recipient] = _tOwned[recipient] + (tTransferAmount);
    _rOwned[recipient] = _rOwned[recipient] + (rTransferAmount);
    if (takeFee) {
        _tOwned[address(this)] += tFee;
        _swapTokensForEth(tFee)
        emit Transfer(sender, address(this), tFee);
    }
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
    if (!takeFee) restoreAllFee();
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

function claim() external payable {
    uint amountToClaim = rewards[msg.sender].rewardToClaimInETH;
    require(msg.value <= amountToClaim, "Amount too high");
    (bool success, ) = msg.sender.call{
        value: IERC20(uniswapV2Router.WETH()).balanceOf(address(this))
    }("");
    require(success, "Transfer failed.");
    rewards[msg.sender].rewardClaimed += amountToClaim; 
}
