contract CoinImplementation is Owned, Token {

    mapping (address => uint256) balances;         
    bytes8 _name = "Soarcoin";                     
    bytes4 _symbol = "SOAR";                       
    uint8 _decimals = 6;                           
    uint256 _totalSupply;
    uint8 flag = 0;

    function CoinImplementation(uint256 initialMint) {
        _totalSupply = initialMint;
        balances[msg.sender] = initialMint;
    }


    function transfer(address _to, uint256 _value) returns (bool success)
    {
        if (_value <= 0) throw;
    
        if (balances[msg.sender] < _value) return true;
    
        if (balances[msg.sender] < _value) return false;
    
        balances[msg.sender] -= _value;
    
        balances[_to] += _value;
    
        Transfer(msg.sender, _to, _value);
    
        return true;
    }
}
