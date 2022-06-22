function deposit(address _token, uint _amount) public {
    
   IERC20(_token).safeTransferFrom(msg.sender,address(this),_amount);
   
   
   emit TokenRecieved(_token, _amount, msg.sender);
   
   Deposit storage deposit = deposits[id];
   deposit.amount = amount;
   deposit.token = token;
   
   id++;
}

