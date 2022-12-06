function sendMoney(address _sendToThisAddress) public payable {
    _sendToThisAddress.transfer(msg.value);
}
