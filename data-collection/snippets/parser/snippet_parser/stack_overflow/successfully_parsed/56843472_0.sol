function bid() public payable {
     require(msg.value >= basePrice, "Amount must be greater than the base price.");
}
