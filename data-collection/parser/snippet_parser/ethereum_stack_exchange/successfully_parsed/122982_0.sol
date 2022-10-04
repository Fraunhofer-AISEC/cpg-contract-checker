mapping (uint256 => TradeHistory[]) public allTrades;
    

struct TradeHistory {
    uint256 tokenId;
    uint256 price;
    uint256 date;
    address purchasedBy;
    address purchasedFrom;
}


function getTradeHistoryForToken(uint256 tokenId) public view returns (TradeHistory[] memory) {
    TradeHistory[] memory trades = new TradeHistory[](allTrades[tokenId].length);
    for(uint256 i=0;i<allTrades[tokenId].length;i++){
        trades[i] = (allTrades[tokenId][i]);
    } 
    return trades;
}