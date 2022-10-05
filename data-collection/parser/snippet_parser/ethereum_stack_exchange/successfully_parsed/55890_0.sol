contract ContractA is DetailedERC20 {

    uint8 public constant decimals = 18;

    uint256 public constant INITIAL_SUPPLY = (500 * (10**6)) * (10 ** uint256(decimals));

    constructor(string _name, string _symbol) 
    public 
    DetailedERC20(_name, _symbol, decimals)
    {
        totalSupply_ = INITIAL_SUPPLY;
        balances[this] = INITIAL_SUPPLY;
        emit Transfer(address(0), this, INITIAL_SUPPLY);
    }
}
