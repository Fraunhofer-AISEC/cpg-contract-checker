    function purchaseStadium (uint8 _stadiumType) public payable {
    require(!paused(), "Stadium sales not available");
    require(stadiumQty[_stadiumType] > 0, "There are no such stadiums left");
    require(addressPurchases[msg.sender] < maxPurchasesPerAccount, "You reached the maximum number of purchased stadiums");
    if(_stadiumType == 0){
        require(msg.value >= moonPrice);
        payable(msg.sender).transfer(msg.value - moonPrice);
    } else if(_stadiumType == 1){
        require(msg.value >= marsPrice);
        payable(msg.sender).transfer(msg.value - marsPrice);
    } else if(_stadiumType == 2){
        require(msg.value >= chaosPrice);
        payable(msg.sender).transfer(msg.value - chaosPrice);
    }
    
    addressPurchases[msg.sender] += 1;

    stadiumQty[_stadiumType] -= 1;

    tokenId.increment();
    _safeMint(msg.sender, tokenId.current());
}
