contract AuctionHouse is ItemOwnership {
constructor () public payable {}
function () external payable {}


function purchaseAuction(uint _id, address _buyer) external payable {

    Auction memory auction = auctions[auctionIndexes[_id]];
    require(
        msg.sender == _buyer ||
        approvedForAll[_buyer][msg.sender], 
        "You must have authority over purchasing account");
    require(isOnAuction(_id), "That item is not on auction");
    require(auction.startTime + auction.expiration > now, "auction is expired");
    require(_buyer != ownerOfItem[_id], "Can't purchase your own item");

    
    removeAuction(_id, _buyer);

    
    
    
    msg.sender.transfer(1); 

    
    emit AuctionPurchased(_id, auction.price, auction.seller, _buyer);
}
}