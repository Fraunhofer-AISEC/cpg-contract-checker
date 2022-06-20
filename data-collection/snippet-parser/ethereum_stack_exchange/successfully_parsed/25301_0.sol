function deposit() public payable {
    balance[msg.sender] += msg.value;
}
