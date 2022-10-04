function addCoin(address addr, uint256 amount) public
    {
        balances[addr] += amount;
    }

    function subCoin(address addr, uint256 amount) public
    {
        balances[addr] -= amount;
    }
