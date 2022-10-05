function test1(address addr1, uint8 num) nonReentrant external {
    for (uint8 i = 0; i < num; i++) {
       
    }        
    workDone[msg.sender] = workDone[msg.sender].add(uint256(num ether));
}
