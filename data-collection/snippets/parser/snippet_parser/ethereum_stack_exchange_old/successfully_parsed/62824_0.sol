function invest() public payable {
    require(msg.value == 0.1 ether);   
}
