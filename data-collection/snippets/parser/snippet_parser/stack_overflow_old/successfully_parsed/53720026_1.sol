    function transfer(address _to, uint256 _value)
public
returns (bool) {
    unlockBalance(msg.sender);

    locker storage l = lockerList[msg.sender];

    if (l.isLocker) {
        require(_value <= balances[msg.sender].available);
        require(_to != address(0));

        balances[msg.sender].available = balances[msg.sender].available.sub(_value);
        addLockedUpTokens(_to, _value, l.lockUpPeriod, l.unlockCount);
    } else { 
        require(_value <= balances[msg.sender].available);
        require(_to != address(0));

        balances[msg.sender].available = balances[msg.sender].available.sub(_value);
        balances[_to].available = balances[_to].available.add(_value);
    }
    emit Transfer(msg.sender, _to, _value);

    return true;
}
