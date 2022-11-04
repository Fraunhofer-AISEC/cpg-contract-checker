function withdrawBalance() {  
        uint amountToWithdraw = userBalances[msg.sender];
        userBalances[msg.sender] = 0;
        if (amountToWithdraw > 0) {
        if (!(msg.sender.send(amountToWithdraw))) { throw; }
    }
}