function buyToken(uint256 _tokenId) public payable {
        TokenSeller memory tokenData = getTokenSellData(_tokenId);
        address tokenOwner = tokenData.tokenOwner;
        uint256 tokenSalePrice = tokenData.tokenSalePrice;
        require(
            msg.value == tokenSalePrice,
            "Purchase Error: Purchase amount doesn't equal the sell price."
        );
        payContract();

        this.safeTransferFrom(address(this), msg.sender, _tokenId);
        emit TokenPurchased(_tokenId, msg.sender, address(tokenOwner));

        
        _paySellerAfterPurchase(tokenOwner, tokenSalePrice);

        
        delete _tokenInfo[_tokenId];
    }
