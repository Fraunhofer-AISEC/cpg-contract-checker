function transfer(address _to, uint256 _amount) external returns (bool) {
    
    require(balances[msg.sender] >= _amount);

    balances[msg.sender] -= _amount; 
    balances[_to] += _amount; 

    emit Transfer(msg.sender, _to, _amount);
    return true;
}
