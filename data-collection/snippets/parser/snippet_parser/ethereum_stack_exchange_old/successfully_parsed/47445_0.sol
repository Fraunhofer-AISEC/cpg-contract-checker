function withdrawBalance()
{ uint amountToWithdraw = userBalances[msg.sender];
if (msg.sender.call.value(amountToWithdraw)() == false)
{
throw;
}
userBalances[msg.sender] = 0;
}
