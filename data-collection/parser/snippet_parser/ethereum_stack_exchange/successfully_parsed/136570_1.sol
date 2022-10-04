function depositMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;

      
      
      Transaction memory deposit = Transaction(msg.value, block.timestamp);
      
      
      Balance storage balance = balanceReceived[msg.sender];

      
      balance.deposits[balance.numDeposits] = deposit;

      
      
      balance.numDeposits++;

    }

