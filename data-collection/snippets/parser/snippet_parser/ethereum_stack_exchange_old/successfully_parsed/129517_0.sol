contract MyDepositContract {


    mapping(address => mapping(address => uint)) internal balances;

    function deposit(address token, uint amount) external {
        uint balance = IERC20(token).balanceOf(msg.sender);
        require(balance >= amount, "insufficient balance");

        
        balances[msg.sender][token] += amount;

        IERC20(token).transferFrom(msg.sender, address(this), amount);

        
        
    }

    function withdraw(address token, uint amount) external {
        uint balance = balances[msg.sender][token];
        require(balance >= amount, "balance is lesser than amount");
        
        
        balances[msg.sender][token] -= amount;

        IERC20(token).transfer(msg.sender, amount);
    }
}
