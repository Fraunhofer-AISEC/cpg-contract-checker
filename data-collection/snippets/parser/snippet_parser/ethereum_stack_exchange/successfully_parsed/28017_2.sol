function balance() constant returns (uint256) {
           return balances[msg.sender];
       }

 function contractBalance() returns (uint256) {
           return this.balance;
       }
