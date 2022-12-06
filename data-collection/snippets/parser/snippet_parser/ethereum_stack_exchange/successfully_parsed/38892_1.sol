function transfer(address to, uint tokens) public returns (bool success){
    if(balances[msg.sender]>=tokens && tokens>=0){
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        return true;
    } else {
        return false;
    }
}
