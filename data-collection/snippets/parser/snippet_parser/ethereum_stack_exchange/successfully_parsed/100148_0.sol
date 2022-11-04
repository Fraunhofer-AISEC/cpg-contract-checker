function getOfferById(uint256 _tokenId) public view returns (uint256) {
    require(_tokenId < MAX_B, "This tokenId does not exist");
    uint256 offer = bOffers[_tokenId];
    require(offer > 0, "There is no offer for this token");
    return offer;
}
