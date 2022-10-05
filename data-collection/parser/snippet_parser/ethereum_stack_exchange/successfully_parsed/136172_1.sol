address public owner = msg.sender;
    uint public tokens = 10000;
    mapping(address=>uint) balances;
    
    constructor() {
       balances[owner] = tokens;
    }
