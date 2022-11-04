    mapping(address => uint) balances;

    mapping(address => mapping(address => uint)) allowed;

    mapping (address => bool) public frozenAccount;

   
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        require(!transactionLock);         
        require(!frozenAccount[from]);     
        require(!frozenAccount[to]);       
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
