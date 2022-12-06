function add(uint256 thingAmount, uint256 thingType) public {
    things[msg.sender][thingType] = things[msg.sender][thingType].add(thingAmount);
}
