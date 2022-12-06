contract MyToken is StandardToken, Ownable {

    string public constant name = "My Sample Token";

    string public constant symbol = "MST";

    uint32 public constant decimals = 18;

    function MyToken(uint _totalSupply) {
       require (_totalSupply > 0);
       totalSupply = _totalSupply;
       balances[msg.sender] = totalSupply;
    }
}
