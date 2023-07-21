function fetchListedNFT() public returns (MarketItem [] memory){
    uint totalCount = _tokenIds.current();
    uint itemCount = 0;
    uint currentIndex = 0;
    for(uint i=0;i<itemCount;i++)
    {
        if(idMarketItem[i+1].seller == msg.sender)
        {
            itemCount++;
        } 
    }
    for(uint i=0;i<itemCount;i++)
    {
        if(idMarketItem[i+1].seller == msg.sender)
        {
            uint currentId = i+1;
            MarketItem storage currentItem = idMarketItem[currentId]; <--------- ERROR
            items[currentIndex]=currentItem;
            currentIndex++;
        }
    }
    return items;
}
