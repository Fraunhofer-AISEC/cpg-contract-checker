    ...

    function marketBuy(uint _tokenId) public returns (bool) {
        address _buyer = msg.sender;
        uint _price = marketItem[_tokenId].price;

        IERC20(ERC20Token).approve(marketItem[_tokenId].seller, _price);
        IERC20(ERC20Token).transferFrom(_buyer, marketItem[_tokenId].seller, _price);
        transferFrom(marketItem[_tokenId].seller, _buyer, _tokenId);
        
        marketItem[_tokenId].seller = _buyer;
        marketItem[_tokenId].isSold = true;

        return true;
    }
    
    ....
