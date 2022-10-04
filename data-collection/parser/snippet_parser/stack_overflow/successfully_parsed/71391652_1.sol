function add(address user, uint256 thingAmount, uint256 thingType) public onlyOwner {
    things[user][thingType] = things[user][thingType].add(thingAmount);
}
