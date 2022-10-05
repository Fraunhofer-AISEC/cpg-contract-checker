function deposit(uint256 amount) public payable {
    msg.value = amount
}
