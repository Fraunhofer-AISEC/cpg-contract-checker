mapping (address => uint256) public balances;
event Transfer(address indexed from, address indexed to, uint tokens);

function transfer(address to, uint tokens) public returns (bool success) 
{
    balances[msg.sender] = balances[msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    Transfer(msg.sender, to, tokens);
    return true;
}
