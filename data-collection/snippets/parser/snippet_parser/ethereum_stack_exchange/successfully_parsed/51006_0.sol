function transferFrom(address _from, address _to, uint256 _value) public onlyPayloadSize(3 * 32) returns (bool) {
    require(_to != address(0));

    var _allowance = allowed[_from][msg.sender];



    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = _allowance.sub(_value);
    emit Transfer(_from, _to, _value);
    if(transferIns[_from].length > 0) delete transferIns[_from];
    uint64 _now = uint64(now);
    transferIns[_from].push(transferInStruct(uint256(balances[_from]),_now));
    transferIns[_to].push(transferInStruct(uint256(_value),_now));
    return true;
}
