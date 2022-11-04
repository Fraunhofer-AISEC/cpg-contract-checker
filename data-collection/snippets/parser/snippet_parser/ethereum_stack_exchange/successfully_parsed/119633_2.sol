function checkUpkeep(bytes calldata checkData) public view returns(bool, bytes memory) {
  
  return (block.timestamp > idToAuctionItem[auctionItemId].startTime + idToAuctionItem[auctionItemId].auctionDuration);
}
