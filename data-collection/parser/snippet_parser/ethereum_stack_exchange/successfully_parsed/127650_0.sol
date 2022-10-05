function createAuction()  public {
    

    Auction newAuction = new Auction("arguments here");

    auctions.push(address(newAuction)); 
}

function getHighestBidder(uint index) public view returns(address){
    address buyer = auctions(index).getHighestBidder();

}
