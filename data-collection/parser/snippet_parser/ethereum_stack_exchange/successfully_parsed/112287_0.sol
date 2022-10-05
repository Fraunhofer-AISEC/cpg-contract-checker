function createNewMigration(string memory title, IERC20 oldTokenAddress, IERC20 newTokenAddress, 
    uint256 decimalsOldToken, uint256 decimalsNewToken, uint256 divider, uint256 tokensForDistribution) public payable {
    require(msg.value == normalMigrationFee, "You need to pay the fee to start the migration!");
    address newMigration = address(new MigrationHelper(msg.sender, title, oldTokenAddress, newTokenAddress,
    decimalsOldToken, decimalsNewToken, divider, tokensForDistribution));
    migrations.push(newMigration);
}
