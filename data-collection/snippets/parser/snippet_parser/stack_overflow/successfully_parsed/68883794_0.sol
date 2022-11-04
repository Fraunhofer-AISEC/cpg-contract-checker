function sendMoney() public payable {
    payable(address(this)).transfer(msg.value);
    balance_received[msg.sender] += msg.value;
}
