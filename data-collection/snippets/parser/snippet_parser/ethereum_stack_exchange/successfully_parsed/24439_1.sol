function () payable {
    
    require(msg.sender == owner);

    
    assert(balance[owner] + msg.value >= balance[owner]);

    
    if(balance[owner] + msg.value > maximum) revert();

    
    Deposit(msg.sender, msg.value);

    
    balance[owner] += msg.value;
}
