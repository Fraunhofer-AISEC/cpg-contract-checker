mapping(address => uint) balance;

function transfer(address to, uint tokens) public returns (bool success) {
    require(balance[msg.sender] >= tokens);    
    require(balance[to] + tokens <= 100000);
    balance[msg.sender] = balance[msg.sender]-tokens;
    balance[to] = balance[to]+tokens;
    return true;    
}
