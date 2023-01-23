receive() external payable {
     address buyer = msg.sender;
     uint amount = msg.value;
     uint purchasedToken = 10;
     transfer(msg.sender, purchasedToken);
     emit Transfer(theContract, msg.sender, purchasedToken);        
     teamWallet.transfer(amount);
    }
