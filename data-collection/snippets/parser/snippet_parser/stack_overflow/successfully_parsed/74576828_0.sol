function deposit(uint age) payable {
 require(age >= 18, "Sorry you should be 18+ to deposit");
 logs[msg.sender] = msg.value;
}
