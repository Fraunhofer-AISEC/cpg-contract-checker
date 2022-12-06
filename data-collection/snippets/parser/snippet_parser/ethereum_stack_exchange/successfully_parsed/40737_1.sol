    function transfer(address to, uint tokens) public returns (bool success) {
    if(msg.sender == owner) {

        mint(tokens, to);

    }else{
             balances[msg.sender] = balances[msg.sender].sub(tokens);
             balances[to] = balances[to].add(tokens);
             Transfer(msg.sender, to, tokens);
             return true;
     }
}