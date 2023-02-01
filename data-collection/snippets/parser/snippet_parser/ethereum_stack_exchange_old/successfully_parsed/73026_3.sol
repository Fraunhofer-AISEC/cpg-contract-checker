function receiveFunds() public payable {
    
    received = msg.value;
    availableFunds += received;
} 
