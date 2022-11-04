function send(uint256 value) public payable { 
    address sender = _msgSender();

    
    if (msg.value >= 1 ether) {
        publish();
    }
}

function publish() public {
}
