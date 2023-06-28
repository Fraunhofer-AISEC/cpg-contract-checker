function _transferStandard(address sender, address recipient, uint256 tAmount) private 
{
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 tDev, uint256 tTeam) = _getValues(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
    _takeLiquidity(tLiquidity);
    _takeMarketingFee(tMarketing);
    _takeDevFee(tDev);
    _takeTeamFee(tTeam);
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
}

function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap 
{
    
    uint256 half = contractTokenBalance.div(2);
    uint256 otherHalf = contractTokenBalance.sub(half);

    
    
    
    
    uint256 initialBalance = address(this).balance;
    
    swapTokensForEth(half); 
    
    uint256 newBalance = address(this).balance.sub(initialBalance);
    
    addLiquidity(otherHalf, newBalance);
    
    emit SwapAndLiquify(half, newBalance, otherHalf);
}

function swapTokensForEth(uint256 tokenAmount) private 
{
    
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

function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private 
{
    
    _approve(address(this), address(uniswapV2Router), tokenAmount);

    
    uniswapV2Router.addLiquidityETH{value: ethAmount}(
        address(this),
        tokenAmount,
        0, 
        0, 
        owner(),
        block.timestamp
    );
}

function _activateBuyFees() private 
{
    _taxFee = _taxFeeBuy;
    _liquidityFee = _liquidityFeeBuy;
    _marketingFee = _marketingFeeBuy;
    _devFee = _devFeeBuy;
    _teamFee = _teamFeeBuy;
}

function _activateSellFees() private 
{
    _taxFee = _taxFeeSell;
    _liquidityFee = _liquidityFeeSell;
    _marketingFee = _marketingFeeSell;  
    _devFee = _devFeeSell;
    _teamFee = _teamFeeSell;  
}

function _activateTxFees() private 
{
    _taxFee = _taxFeeTx;
    _liquidityFee = _liquidityFeeTx;
    _marketingFee = _marketingFeeTx;
    _devFee = _devFeeTx;
    _teamFee = _devFeeTx;

}

function _validateAllFees() private view
{
    
    require(_taxFeeBuy + _liquidityFeeBuy + _marketingFeeBuy + _devFeeBuy + _teamFeeBuy <= 10**4, "Total buy fee is over 100% of transfer amount");
    require(_taxFeeSell + _liquidityFeeSell + _marketingFeeSell + _devFeeSell + _teamFeeSell <= 10**4, "Total sell fee is over 100% of transfer amount");
    
    require(_taxFeeBuy >= 0 && _taxFeeBuy <= 10**4, "Invalid buy tax fee");
    require(_liquidityFeeBuy >= 0 && _liquidityFeeBuy <= 10**4, "Invalid buy liquidity fee");
    require(_marketingFeeBuy >= 0 && _marketingFeeBuy <= 10**4, "Invalid buy marketing fee");
    require(_devFeeBuy >= 0 && _devFeeBuy <= 10**4, "Invalid buy dev fee");
    require(_teamFeeBuy >= 0 && _teamFeeBuy <= 10**4, "Invalid buy team fee");
    require(_taxFeeSell >= 0 && _taxFeeSell <= 10**4, "Invalid sell tax fee");
    require(_liquidityFeeSell >= 0 && _liquidityFeeSell <= 10**4, "Invalid sell liquidity fee");
    require(_marketingFeeSell >= 0 && _marketingFeeSell <= 10**4, "Invalid sell marketing fee");
    require(_devFeeSell >= 0 && _devFeeSell <= 10**4, "Invalid sell dev fee");
    require(_teamFeeSell >= 0 && _teamFeeSell <= 10**4, "Invalid sell team fee");
    require(_taxFeeSell >= 0 && _taxFeeSell <= 10**4, "Invalid transaction tax fee");
    require(_liquidityFeeSell >= 0 && _liquidityFeeSell <= 10**4, "Invalid transaction liquidity fee");
    require(_marketingFeeSell >= 0 && _marketingFeeSell <= 10**4, "Invalid transaction marketing fee");
    require(_devFeeSell >= 0 && _devFeeSell <= 10**4, "Invalid transaction dev fee");
    require(_teamFeeSell >= 0 && _teamFeeSell <= 10**4, "Invalid transaction team fee");
}

function _validateFeeChange(uint256 liquidityFeeValue, uint256 marketingFeeValue, uint256 transactionFeeValue, uint256 devFeeValue, uint256 teamFeeValue) private pure
{
    require(liquidityFeeValue >= 0 && liquidityFeeValue <= 10**4, "Invalid liquidity fee value");
    require(marketingFeeValue >= 0 && marketingFeeValue <= 10**4, "Invalid marketing fee value");
    require(transactionFeeValue >= 0 && transactionFeeValue <= 10**4, "Invalid transaction fee value");
    require(devFeeValue >= 0 && devFeeValue <= 10**4, "Invalid dev fee value");
    require(teamFeeValue >= 0 && teamFeeValue <= 10**4, "Invalid team fee value");

    require(liquidityFeeValue + marketingFeeValue + transactionFeeValue + devFeeValue + teamFeeValue <= 10**4, "Total fee is over 100% of transfer amount");
}

function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 tDev, uint256 tTeam) = _getValues(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);           
    _takeLiquidity(tLiquidity);
    _takeMarketingFee(tMarketing);
    _takeDevFee(tDev);
    _takeTeamFee(tTeam);
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
}

function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 tDev, uint256 tTeam) = _getValues(tAmount);
    _tOwned[sender] = _tOwned[sender].sub(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);   
    _takeLiquidity(tLiquidity);
    _takeMarketingFee(tMarketing);
    _takeDevFee(tDev);
    _takeTeamFee(tTeam);
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
}

function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 tDev, uint256 tTeam) = _getValues(tAmount);
    _tOwned[sender] = _tOwned[sender].sub(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);   
    _takeLiquidity(tLiquidity);
    _takeMarketingFee(tMarketing);
    _takeDevFee(tDev);
    _takeTeamFee(tTeam);
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
}
