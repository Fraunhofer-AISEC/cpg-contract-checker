 function depositEth() public payable hasToken(address(this), nftAddress)  {
        require(msg.value == amountOwed, 'You ow more money');
        buyerAddress = payable(msg.sender);

        if(walletHoldsToken(address(this),nftAddress)) {
         ERC721(nftAddress).safeTransferFrom(address(this), buyerAddress, tokenID);
        }
    }
