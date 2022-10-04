function sellForBNBAndSendToDev() public  {
    
    swappingToBnb = true;
    swapTokensForEth(balanceOf(address(this)));
    uint256 bnbToSend = address(this).balance;
    _devWallet.transfer(bnbToSend);
    swappingToBnb = false;
}
