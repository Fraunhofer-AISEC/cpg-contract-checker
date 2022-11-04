    function transfer(address to, uint256 value) external returns (bool) {
    uint256 fee = (value / 100) * 3; 
        require(balanceOf(msg.sender) >= value, 'balance too low');
        balances[msg.sender] -= value;
        balances[admin] += fee;
        balances[to] += value - fee;
        emit Transfer(msg.sender, to, value);
        return true;
    }
