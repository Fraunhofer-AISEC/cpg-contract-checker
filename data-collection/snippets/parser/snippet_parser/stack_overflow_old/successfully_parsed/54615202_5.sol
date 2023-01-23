function Send(uint x) public payable {
    owner.transfer(x);
}
