function mint(uint amount) {
    totalSupply += amount;
    balanceOf[msg.sender] += amount;
    emit Transfer(address(0x0), msg.sender, amount);
}
