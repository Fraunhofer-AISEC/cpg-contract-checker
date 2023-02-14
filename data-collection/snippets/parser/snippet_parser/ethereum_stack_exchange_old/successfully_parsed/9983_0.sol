function balanceOf(address user) public constant returns (uint256) {
    return balances[msg.sender].cash;
}
