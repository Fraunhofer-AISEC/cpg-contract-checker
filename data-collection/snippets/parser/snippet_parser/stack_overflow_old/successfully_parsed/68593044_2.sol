 function deposit() public payable {
    balances[msg.sender] += msg.value;
}
