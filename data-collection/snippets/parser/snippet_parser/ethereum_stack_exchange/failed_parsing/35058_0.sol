function transfer(address _to, uint256 _value) public returns (bool) {

    require(_to != address(0));
    if (updateBalance(_to, _value)) { 
        if(allowedContracts[_to]) {
            BIHReceiver receiver = BIHReceiver(_to);
            receiver.tokenFallback(msg.sender,_value);
        }
        Transfer(msg.sender, _to, (_value.sub(feePaid)));
        Transfer(msg.sender, feeWallet, (feePaid));
    }
    return true;
}


function updateBalance(address _to, uint256 _value) public returns (bool) {

    require(_to != address(0));
    if (checkBalance(_to,_value)) {
        uint256 feePaid = (_value.mul(fee).div(10000);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value.sub(feePaid));
        balances[feeWallet] = balances[feeWallet].add(feePaid);
        return true;
    }
} 

function checkBalance(address _to, uint256 _value) public returns (bool) {

    require(_to != address(0));
    if(_value > 0) {
        if(balances[msg.sender] == 0) {
            addresses[indexes[msg.sender]] = addresses[lastIndex];
            indexes[addresses[lastIndex]] = indexes[msg.sender];
            indexes[msg.sender] = 0;
            delete addresses[lastIndex];
            lastIndex--;
        }
        if(indexes[_to]==0) {
            lastIndex++;
            addresses[lastIndex] = _to;
            indexes[_to] = lastIndex;
        }
        return false;
    } else {
        return true; 
    }
}
