function test() payable {
msg.sender.transfer((balances[msg.sender]/1000)*this.balance);
}
