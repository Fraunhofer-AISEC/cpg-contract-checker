contract TestToken {
    mapping(address => uint) balance;
    error InsufficientBalance(uint256 available, uint256 required);
    function transfer(address to, uint256 amount) public {
        if (amount > balance[msg.sender])
            
            
            revert InsufficientBalance({
                available: balance[msg.sender],
                required: amount
            });
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
    
}
