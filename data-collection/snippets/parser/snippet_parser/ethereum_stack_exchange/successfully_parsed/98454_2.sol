function sendEther(address payable recipient) public payable {
    require(msg.value == 1 ether, 'Only 1 ether allowed to be transfered.');
    recipient.transfer(msg.value);
}
