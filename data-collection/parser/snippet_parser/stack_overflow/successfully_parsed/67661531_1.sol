function balanceOf(address owner) public view returns(uint) {
    return balances[owner];
}
