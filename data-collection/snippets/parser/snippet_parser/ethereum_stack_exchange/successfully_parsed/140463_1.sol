

function transferFrom(address from, address to, uint value) public returns (bool) { 
    require(balanceOf(from) >= value, "balance too low"); 
    require(allowance[from][msg.sender] >= value, "allowance too low"); 
    balances[to] += value; balances[from] -= value; 
    emit Transfer(from, to, value); 
    return true; 
}


