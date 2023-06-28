contract TestToken is ERC20Standard {
     constructor() public {
        totalSupply = 100000000;
        name = "Test Token";
        decimals = 6;
        symbol = "TST";
        version = "1.0";
        balances[msg.sender] = totalSupply;
    }
}
