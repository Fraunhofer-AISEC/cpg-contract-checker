function swapTokenToEvolve(uint256 _tokenAmount, uint256 _stageIndex)
    public
    checkStageTime(_stageIndex)
    checkRemainingAmount(_tokenAmount, _stageIndex)
    nonReentrant
    returns (bool)
{
    
    uint256 tokenPrice = salesStages[_stageIndex].price;
    
    uint256 stableTokenAmount = multiply(_tokenAmount, tokenPrice, decimal);
    
    require(
        IERC20(currencyToken).transferFrom(
            owner(),
            _msgSender(),
            _tokenAmount
        )
    );
    
    require(
        IERC20(token).transferFrom(_msgSender(), owner(), stableTokenAmount)
    );
    salesStages[_stageIndex].liquidity = salesStages[_stageIndex]
        .liquidity
        .sub(_tokenAmount);
    return true;
}
