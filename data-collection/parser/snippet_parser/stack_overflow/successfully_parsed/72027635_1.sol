contract TestToken {
        mapping(address => uint) balance;
        error InsufficientBalance(uint256 available, uint256 required);
        function transfer(address to, uint256 amount) public {
            require(balance[msg.sender]<amount, "Insufficient Balance");
            balance[msg.sender] -= amount;
            balance[to] += amount;
        }
        
    }
