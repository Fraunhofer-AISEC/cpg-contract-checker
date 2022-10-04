function buy(uint256 tokenId, uint256 amount, uint256 toBuddyId) external payable { 
    require(tokenInContract[tokenId], "Token doesn't exist in contract");
    SellDetails storage details = sellDetails[tokenId];

    require(details.price != 0, "Buddy goo not on sale");
    require(details.maxSell - details.amountSold >= amount, "Not enough goo available");
    require(msg.value >= details.price * amount);

    uint256 buddyBalance = gooContract.balanceOf(tokenId);
    require(buddyBalance >= amount, "Not enough balance on buddy");

    gooContract.transfer(tokenId, toBuddyId, amount);
    (bool sent, ) = payable(details.seller).call{value: msg.value*99/100}("");
    require(sent, "Failed to send Matic to owner");
    (bool sentComm, ) = payable(owner).call{value: msg.value*1/100}("");
    require(sentComm, "Failed to send Matic commision");

    totalForSale -= amount;
    sellDetails[tokenId].amountSold += amount;
    totalSold += amount;
    totalMaticSeen += msg.value;
}
