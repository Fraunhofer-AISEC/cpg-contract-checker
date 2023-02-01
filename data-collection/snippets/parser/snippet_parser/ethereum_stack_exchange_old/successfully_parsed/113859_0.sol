function mintSubContract(uint256 initialAmount) public returns (address) {
    SubContract sub = new SubContract(msg.sender, address(this));
    address subAddress = address(sub);
    if (initialAmount > 0) {
        _transfer(msg.sender, address(sub), initialAmount);
    }
    _subAddresses.push(address(sub));
    sub.mint(msg.sender, 0);
    return address(sub);
}
