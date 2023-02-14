function _transfer(address from, address _to, uint256 _value) private {
     if(to==msg.sender) {
         taxfee=7
         balances[from] = balances[from].sub(_value);
         balances[_to] = balances[_to].add(_value);
         emit Transfer(from, _to, _value);
     }
     else {
        taxfee=1
        balances[from] = balances[from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(from, _to, _value);
     }
}
