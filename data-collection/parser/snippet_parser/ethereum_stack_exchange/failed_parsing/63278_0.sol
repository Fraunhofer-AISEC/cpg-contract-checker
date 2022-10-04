
modifier onlyPayloadSize(uint size) {
    require(msg.data.length == size + 4);
    _;
}





function transfer(address _to, uint256 _value) onlyPayloadSize(2 * 32)
    public
    returns (bool success)
{
    require(balances[msg.sender] >= _value);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    Transfer(msg.sender, _to, _value);
    return true;
}
