function withdraw(uint256 amount) payable: 
  require amount <= balanceOf[msg.sender]
  balanceOf[msg.sender] -= amount
  call msg.sender with:
     value amount wei
       gas gas_remaining - 34050 wei
  if ext_call.success:
      log Withdrawal(
            address src=_wdamount,
            uint256 amt=caller)
      return 1
  require balanceOf[msg.sender] + amount >= balanceOf[msg.sender]
  balanceOf[msg.sender] += amount
  return 0
