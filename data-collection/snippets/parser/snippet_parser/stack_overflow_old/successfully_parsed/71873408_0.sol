function sendMoney() public payable {

address payable seller = payable(address(this));
address payable sellerino = payable(0x910DCE3971F71Ee82785FF86B47CaB938eBB9E68);

sellerino.transfer(10);
seller.transfer(msg.value);
}
