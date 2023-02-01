function sendCoin(address receiver, uint amount) returns (bool sufficient) {     
                                                                                     

            if (balances[msg.sender] < amount || balances[receiver] + amount < balances[receiver]) throw;             

            balances[msg.sender] -= amount;         

                 
        balances[receiver] += amount;                                           
        return true;

    
    
