function proposeNumber(uint number) public payable {
    require(msg.value > .01 ether);
    proposals.push(number);
}
