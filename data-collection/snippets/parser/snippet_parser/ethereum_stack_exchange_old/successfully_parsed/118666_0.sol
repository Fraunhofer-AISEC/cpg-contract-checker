 function createMarketSale(address nftContract, uint256 itemId)
        public
        payable
        nonReentrant
    {
        uint256 price = idToMarketItem[itemId].price; 
        uint256 tokenId = idToMarketItem[itemId].tokenId; 
        uint256 fee = price / divisionFeePrice; 
        uint256 priceWithFee = price + fee; 
        require(
            msg.value == priceWithFee,
            "Please submit the asking price in order to complete the purchase"
        );
         
        _ownerLocal.transfer(fee);
        
        idToMarketItem[itemId].seller.transfer(price); 

        IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId); 
        
        idToMarketItem[itemId].owner = payable(msg.sender); 
        idToMarketItem[itemId].sold = true;
        
        _itemsSold.increment();
    }
