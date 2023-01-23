   function buyTokensForBnb() public payable {
    require(msg.value > minbuy, "MINIMUM PURCHASE IS 0.01 BNB");
    require(msg.value <= maxbuy, "MAX BUY IS 10 BNB");
    require(getPresaleState() == 5 || getPresaleState() == 4, "PRESALE IS NOT RUNNING(COULD BE CANCELLED OR ENDED, OR FINALIZED)");
    
    if(block.timestamp > endDate || block.timestamp < startDate) {
          revert("You can't buy this token yet or Presale had already ended, tokens cannot be purchased any longer.");
    } else {
        if(getPresaleState() == 4) {
            
            PresaleWallet storage presaleWallet = presaleWallets[msg.sender];
            if(presaleWallet.whitelisted == false) {
                if(block.timestamp >= whitelistedEndDate) {
                    presaleState = PresaleState.LIVE;
                    generateReceiptAndUserPurchasedTokens(msg.sender, msg.value);
                } else {
                  revert('REFUNDED, YOUR WALLET IS NOT WHITELISTED');   
                }
            } else {
                
                generateReceiptAndUserPurchasedTokens(msg.sender, msg.value);
            }
        } else if(getPresaleState() == 5) {
            generateReceiptAndUserPurchasedTokens(msg.sender, msg.value);
        } else {
            revert('REFUNDED, PRESALE IS NOT LIVE OR IN WHITELISTED MODE');
        }
    }
}
