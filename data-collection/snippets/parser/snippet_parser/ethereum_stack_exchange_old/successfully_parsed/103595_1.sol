function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) {

    
    
    
    
    require(!((_value != 0) && (allowed[msg.sender][_spender] != 0)));

    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
}
