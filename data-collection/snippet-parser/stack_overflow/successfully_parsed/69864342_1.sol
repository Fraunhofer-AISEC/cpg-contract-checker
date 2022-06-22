function withdraw() public payable onlyOwner {
    uint balance = address(this).balance;
    payable(msg.sender).transfer(balance / 100 * 10);
    payable(_friend).transfer(balance / 100 * 90);
}
