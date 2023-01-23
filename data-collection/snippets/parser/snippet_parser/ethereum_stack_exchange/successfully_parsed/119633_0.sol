function concludeAuction(address nftContract, uint256 auctionItemId) public payable nonReentrant {
require(msg.sender == idToAuctionItem[auctionItemId].seller, "You're not the auction creator");
require(block.timestamp > idToAuctionItem[auctionItemId].startTime + idToAuctionItem[auctionItemId].auctionDuration, "Bidding period not yet over");
require(idToAuctionItem[auctionItemId].sold == false, "Auction already concluded or canceled");

uint settlementPrice = idToHighestBid[auctionItemId].bidAmount;
uint tokenId = idToAuctionItem[auctionItemId].tokenId;

NFT nft = NFT(nftContract);
address soulCreator = nft.getSoulCreator(tokenId);
uint royalty = nft.getRoyalty(tokenId);


uint _commissionValue = settlementPrice / 40 ;
uint _royalty = (settlementPrice * royalty) / 100 ;
uint _sellerValue = settlementPrice - _commissionValue - _royalty ;

payable(idToAuctionItem[auctionItemId].seller).transfer(_sellerValue);
owner.transfer(_commissionValue); 
IERC721(nftContract).transferFrom(address(this), idToHighestBid[auctionItemId].bidder, tokenId);

idToAuctionItem[auctionItemId].owner = payable(idToHighestBid[auctionItemId].bidder);
idToAuctionItem[auctionItemId].sold = true;
_auctionItemsSold.increment();
payable(soulCreator).transfer(_royalty);
}
