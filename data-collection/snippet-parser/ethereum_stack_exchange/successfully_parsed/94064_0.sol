function sendBackOne() public payable {
    msg.sender.transfer(msg.value);
}

function sendBackTwo() public payable {
    revert();
}
