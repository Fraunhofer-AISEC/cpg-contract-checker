function withdraw() external isOwner() {
    address payable owner = address(uint160(getOwner()));
    owner.transfer(address(this).balance);
}
