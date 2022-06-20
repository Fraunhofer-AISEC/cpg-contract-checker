function checkOffers() public returns (bool){
    uint256 a = sha256(offerFromProducer);
    uint256 b = sha256(offerFromConsumer);
    if(a == b){
        return true;
    }
    return false;
}
