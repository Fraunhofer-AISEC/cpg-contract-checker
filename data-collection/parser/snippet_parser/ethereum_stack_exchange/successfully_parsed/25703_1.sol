



function generateTokens(address _owner, uint _amount
) onlyController returns (bool) {
    uint curTotalSupply = totalSupply();
    require(curTotalSupply + _amount >= curTotalSupply); 
    uint previousBalanceTo = balanceOf(_owner);
    require(previousBalanceTo + _amount >= previousBalanceTo); 
    updateValueAtNow(totalSupplyHistory, curTotalSupply + _amount);
    updateValueAtNow(balances[_owner], previousBalanceTo + _amount);
    Transfer(0, _owner, _amount);
    return true;
}
