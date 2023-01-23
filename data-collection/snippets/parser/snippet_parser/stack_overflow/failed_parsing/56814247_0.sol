library Balances {
    function move(mapping(address => uint256) storage balances, 
        address from, 
        address to, 
        uint amount) internal {
            require(balances[from] >= amount);
            require(balances[to] + amount >= balances[to]);
            balances[from] -= amount;
            balances[to] += amount;
        ...
