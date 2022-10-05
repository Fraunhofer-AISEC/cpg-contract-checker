function getOfferById(uint256 _tokenId) public view returns (
  uint256 offer, bool tokenExists) {
    offer = bOffers[_tokenId];
    tokenExists = _tokenId < MAX_B;
}
