function bid(uint256 _bidIndex, uint256 _twitterID) public {
    require(!bidders[msg.sender].bided);

    bidders[msg.sender].bid = _bidIndex;
    campaigns[_bidIndex].bidCount += 1;
    totalBids += 1;
}
