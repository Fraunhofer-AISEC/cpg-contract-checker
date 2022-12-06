

contract splitter { 


event paymentReceived(uint256 value, address sender);


constructor(address[] memory _owners) {
    owners = _owners; 
}


receive() external payable {
    uint i;
    uint l = owners.length; 
    uint256 value = msg.value/l; 
    
    for (i=0;i<l;i++) {
        payable(owners[i]).transfer(value);
    }
    
    emit paymentReceived({
        value:  msg.value,
        sender: msg.sender
    });
}
}
