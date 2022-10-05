function withdraw() {
    uint256 amount = this.balance / 2;
    addressOne.transfer(amount);
    addressTwo.transfer(amount);
}
