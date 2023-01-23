function swapAndSendBonusDividends(address _to, uint256 _tokenAmount) private {
    swapTokensForEth(_tokenAmount);
    dividendTracker.setBalance(payable (_to), balanceOf(_to));
}

function swapAndSendBuyerDividends(address _to, uint256 _tokenAmount) private {
    swapTokensForEth(_tokenAmount);
    dividendTracker.setBalance(payable (_to), balanceOf(_to));
}
