struct Balance {
    uint totalBalance;
    uint numPayments;
   
}

mapping(address => Balance) public deposits;

function sendMoney() public payable {
        
        Balance storage userAccount = deposits[msg.sender]; <--- is this bad practice or negligible? 
        
     
    }
