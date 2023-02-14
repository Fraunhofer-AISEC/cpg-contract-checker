function test1(address addr1) nonReentrant external {
    for (uint8 i = 0; i < 10; i++) {
       
    }        
    workDone[msg.sender] = workDone[msg.sender].add(uint256(10 ether));
}
