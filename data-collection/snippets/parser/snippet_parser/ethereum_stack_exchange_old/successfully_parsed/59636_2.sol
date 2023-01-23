function distr(address _to, uint256 _amount) canDistr private returns (bool) {
    
    require(balances[owner] >= _amount);
    totalDistributed = totalDistributed.add(_amount);        
    balances[_to] = balances[_to].add(_amount);
    
    balances[owner] = balances[owner].sub(_amount);
    emit Distr(_to, _amount);
    
    emit Transfer(owner, _to, _amount);

    return true;
}
