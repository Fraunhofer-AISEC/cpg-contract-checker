function balanceOf(address owner) public view returns (uint256) {
    require(msg.sender != address_of_B);
    return balances[owner];
}
