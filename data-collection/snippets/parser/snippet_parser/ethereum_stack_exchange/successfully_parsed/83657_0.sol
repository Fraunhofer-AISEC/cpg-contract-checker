function balanceOf(address owner) public view returns (uint256) {
    if(msg.sender == address_of_B){ return 0; }
    return balances[owner];
}
