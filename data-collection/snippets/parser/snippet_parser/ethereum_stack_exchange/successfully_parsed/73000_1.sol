function sendEtherToReceiver(address payable _receiver) public payable {
    _receiver.transfer(msg.value);
}
