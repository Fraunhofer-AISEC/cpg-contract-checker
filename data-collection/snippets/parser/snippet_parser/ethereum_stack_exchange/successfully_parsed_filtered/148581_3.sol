function distributeTokens(uint8 memory indexValue) public onlyOwner {
    require(token.balanceOf(address(this)) >= 1000000 * recipientsCount, "Insufficient balance to distribute tokens");

    for (uint256 i = 0; i < recipientsList[indexValue].length; i++) {
        if (recipients[recipientsList[indexValue][i]]) {
            require(token.transfer(recipientsList[indexValue][i], 1000000), "Token transfer failed");
        }
    }
}
