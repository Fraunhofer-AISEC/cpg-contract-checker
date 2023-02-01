contract Escrow {

    ERC20 token = ERC20(0xABCDEF....);

    event Deposit(address sender, uint amount);
    event Withdraw(address sender, uint amount);

    mapping (address => uint) deposits;

    
    function deposit(uint amount) public {
        
        token.transferFrom(msg.sender, amount);
        deposits[msg.sender] += amount;

        emit Deposit(msg.sender, amount);
    }

    function withdraw(uint amount) public {
        
        require(deposits[msg.sender] >= amount);

        
        if (condition) {
            
            deposits[msg.sender] -= amount;
            token.transfer(msg.sender, amount);

            emit Withdraw(msg.sender, amount);
        } else {
            revert();
        }
    }
}
