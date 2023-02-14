function transfer(address _to, uint _value, bytes _data) {
    
    
    uint codeLength;

    assembly {
        
        codeLength := extcodesize(_to)
    }

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    if(codeLength>0) {
        ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
        receiver.tokenFallback(msg.sender, _value, _data);
    }
    Transfer(msg.sender, _to, _value, _data);
}
