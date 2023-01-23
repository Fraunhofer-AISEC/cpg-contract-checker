function transferToaddress(address payable addressToSend) public payable{
    addressToSend.transfer(0.5 ether);
}
