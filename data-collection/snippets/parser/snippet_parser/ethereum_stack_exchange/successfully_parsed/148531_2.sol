uint256 public recipientsCount;

function distributeTokens() public onlyOwner {
        require(token.balanceOf(address(this)) >= 1000000 * recipientsCount, "Insufficient balance to distribute tokens");

        for (uint256 i = 0; i < recipientsList.length; i++) {
            if (recipients[recipientsList[i]]) {
                require(token.transfer(recipientsList[i], 1000000), "Token transfer failed");
            }
        }
}