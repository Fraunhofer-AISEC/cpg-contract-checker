 function depositCollateral() public payable {
        
        require(msg.sender.balance >= amount, " Insufficient balance");

        payable(address(this)).transfer(amount);
    }
