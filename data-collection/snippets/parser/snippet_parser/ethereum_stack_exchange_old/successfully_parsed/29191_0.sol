function() public payable {
    msg.sender.transfer(msg.value);
}
