
function deposit() public payable returns (uint) {
    
    
    require((balances[msg.sender] + msg.value) >= balances[msg.sender]);

    balances[msg.sender] += msg.value;
    
    

    LogDepositMade(msg.sender, msg.value); 

    return balances[msg.sender];
}
