function sendEther(address payable recipient) public payable {
    recipient.transfer(msg.value);
}
