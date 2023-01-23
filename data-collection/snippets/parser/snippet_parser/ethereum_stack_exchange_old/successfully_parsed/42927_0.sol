function sendMoney(address toAddress, string comment) public payable returns (bool)  {        
    toAddress.transfer(msg.value);        
    moneyTransfers[toAddress].structArray.push(MoneyTransfer({sender:msg.sender, 
        creationTime:now, quantity:msg.value, comment:comment}));        
    return true;
}
