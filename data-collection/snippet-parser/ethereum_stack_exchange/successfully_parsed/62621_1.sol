function sendMoney(address to, uint value) public {
   address payable receiver = payable(to);
   receiver.transfer(value);
}
