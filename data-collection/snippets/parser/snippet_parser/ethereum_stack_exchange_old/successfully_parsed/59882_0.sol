contract Token is StandardToken, Ownable {

    string public name = "";
    string public symbol = "";
    uint8 public decimals = 18;

    constructor(string _name, string _symbol, uint256 _supply, address creator) public {
        owner = creator;
        name = _name;
        symbol = _symbol;
        totalSupply_ = _supply;
        balances[owner] = totalSupply_;
        Transfer(0x0, owner, balances[owner]);
    }
}