function rent(uint256 tokenId, uint256 period, address payable owner) onlyOffPause() payable public returns (bool) {


require(period > minMonthBasic && period <= maxMonthBasic);

require(owner == ownerOf(tokenId));







if(plotdata[tokenId]._rented){
    require(msg.sender == renterOf(tokenId));

    

    require(checkBasicCare(tokenId) == true);

    

    if(plotdata[tokenId]._lastRentingPrice == 0){
        plotdata[tokenId]._rented = false;

        plotdata[tokenId]._renterOf = address(0);

        

    }

}

...
