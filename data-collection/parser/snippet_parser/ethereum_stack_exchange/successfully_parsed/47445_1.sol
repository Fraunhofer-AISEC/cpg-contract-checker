function withdrawBalance()
{
    uint amountToWithdraw = userBalances[msg.sender];
    userBalances[msg.sender] = 0;
    if (msg.sender.call.value(amountToWithdraw)() == false) {
        throw;
    }
}
