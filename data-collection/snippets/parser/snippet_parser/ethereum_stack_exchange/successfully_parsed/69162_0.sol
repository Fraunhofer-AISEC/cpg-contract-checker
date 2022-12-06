function withdraw(uint256 amount) public payable returns(bool) {
    require(accounts[msg.sender].balance >= amount);
    accounts[msg.sender].balance -= amount;
    bool r = msg.sender.send(amount);
    if (!r){
        accounts[msg.sender].balance += amount;
    }
    return r;   
}
