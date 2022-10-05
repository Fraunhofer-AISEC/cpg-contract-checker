function transfer(address _to, uint256 _amount) external {
    balances[msg.sender] -= _amount;
    balances[_to] += _amount;
}
