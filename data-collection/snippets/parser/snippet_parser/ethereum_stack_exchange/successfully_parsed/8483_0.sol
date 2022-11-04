function contribute(uint _campaignID){       
    Campaign c = campaigns[_campaignID];      
    uint256 amount = msg.value; 
    c.balanceOf[msg.sender] = amount;    
    c.amountRaised += amount;
    check = 'check4';
    token.transfer(msg.sender,amount/c.tokenValue); 
    check = 'check5';
    FundTransfer(msg.sender, amount, true);      
} 
