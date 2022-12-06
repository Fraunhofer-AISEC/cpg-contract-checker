function purchase(uint numberOfTokens) public payable {
    require(numberOfTokens <= 50, "Can only purchase a maximum of 50");
    require(_price.mul(numberOfTokens) <= msg.value, "Ether value sent is not correct");
    mintToSender(numberOfTokens);
}
