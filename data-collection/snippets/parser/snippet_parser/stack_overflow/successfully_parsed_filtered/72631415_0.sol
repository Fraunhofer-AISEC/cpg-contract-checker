mapping(address => uint256) public coffeKitchenLatestAqcuiredBalances;

function requestStarCoinFromCoffeeKitchenFaucet() public {
    address callerAddress = msg.sender;
    uint256 userLastRetrieveTime = coffeKitchenLatestAqcuiredBalances[callerAddress];
    if (userLastRetrieveTime != 0){
        uint256 epochNow = block.timestamp;
        require(userLastRetrieveTime < epochNow - 7200,"You need to wait for 2 hours from your last call");
    }
}
