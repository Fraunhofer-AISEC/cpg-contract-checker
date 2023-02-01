function purchase(uint amount, uint tokens) public payable{
        require (msg.value >= amount * 1 ether, "You must pay at least 1 ether per token");
        balances[address (this)] -= tokens;
        balances[msg.sender] += tokens; 
