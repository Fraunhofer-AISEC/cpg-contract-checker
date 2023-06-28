  function makeDeposit() public payable {
        require(msg.value > 0);

        

        amountDeposited += userBalance[msg.sender]; 
    

        emit Deposit(msg.sender, name, msg.value);
    }
