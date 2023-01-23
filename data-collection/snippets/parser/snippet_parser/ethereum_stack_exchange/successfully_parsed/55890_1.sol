contract ContractB {

    ERC20 public token;

    constructor(ERC20 _token) public {
        token = _token;
    }

    function burn() internal {
        token.balances[address(token)] = 0;
        token.totalSupply_ = 0;
    }
}
