function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
    
    if (msg.value < FEE) {
        return false;
    }
    if (!MYADDR.send(msg.value) {
        throw;
    }

    
    balances[_to]   += _value;
    balances[_from] -= _value;
    return true;
}
