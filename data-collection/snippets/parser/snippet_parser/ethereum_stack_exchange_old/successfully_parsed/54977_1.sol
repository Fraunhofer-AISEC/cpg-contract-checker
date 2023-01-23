function getMarket(bytes32 marketHash) public view returns(LibMarket.Market) {
    return hashToMarket[marketHash];
}
