function withdraw(uint256 amount) payable: 
  require amount <= balanceOf[msg.sender]
  balanceOf[msg.sender].sub(amount)  
  log Withdrawal(
    address src=_wdamount,
    uint256 amt=caller)
  require
     call msg.sender with:
       value amount wei
       gas gas_remaining - 34050 wei
  return 1
