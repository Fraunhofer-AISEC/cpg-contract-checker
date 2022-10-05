function withdrawEntireBalance() payable external {
    require(msg.sender == contractOwner, "ERROR! Only Contract's owner may call!");
    
    msg.sender.transfer(address(this).balance);
}
