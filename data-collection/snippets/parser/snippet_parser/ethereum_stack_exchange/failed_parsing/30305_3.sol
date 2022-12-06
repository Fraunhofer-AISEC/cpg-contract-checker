function _transfer(address _from, address _to, uint value) internal {
    
    ....
    
    balances[_from].balance -= value;
    balances[_to].balance += value;
    if(!balances[_from].doesItExistInArray) {
        allAccounts.push(_from);
        balances[_from].doesItExistInArray = true;
    }
    
}
