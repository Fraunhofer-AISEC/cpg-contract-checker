function transferFromPreSigned(
    bytes _signature,
    address _from,
    address _to,
    uint256 _value,
    uint256 _fee,
    uint256 _nonce
)
    public
    returns (bool)
{
    require(_to != address(0));
    require(signatures[_signature] == false);
     bytes32 hashedTx = transferFromPreSignedHashing(address(this), _from, _to, _value, _fee, _nonce);
     address spender = recover(hashedTx, _signature);
    require(spender != address(0));
     balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][spender] = allowed[_from][spender].sub(_value);
     balances[spender] = balances[spender].sub(_fee);
    balances[msg.sender] = balances[msg.sender].add(_fee);
    signatures[_signature] = true;
     Transfer(_from, _to, _value);
    Transfer(spender, msg.sender, _fee);
    return true;
}

function transferFromPreSignedHashing(
    address _token,
    address _from,
    address _to,
    uint256 _value,
    uint256 _fee,
    uint256 _nonce
)
    public
    pure
    returns (bytes32)
{
    
    return keccak256(bytes4(0xb7656dc5), _token, _from, _to, _value, _fee, _nonce);
}
