function createMarketSale(address nftContract, uint256 itemId, uint256 commission)  
 public  
 payable  
 nonReentrant  
    {  
        uint256 price = idToMarketItem[itemId].price;  
        uint256 tokenId = idToMarketItem[itemId].tokenId;  
 require(  
 msg.value == price,  
 "Please submit the asking price in order to complete the purchase"  
        );  
        idToMarketItem[itemId].seller.transfer(msg.value);  
 IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);  
        idToMarketItem[itemId].owner = payable(msg.sender);  
        idToMarketItem[itemId].sold = true;  
        _itemsSold.increment();  
 payable(owner).transfer(commission);  
    }
