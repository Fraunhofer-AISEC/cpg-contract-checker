(contract Bank)

function Collect(uint _amount)
    public
    payable
    {
        var acc = Acc[msg.sender];
        if( acc.balance>=MinSum && acc.balance>=_am && now>acc.unlockTime)
        {
            if(msg.sender.call.value(_amount)())
            {
                acc.balance-=_amount;
                LogFile.AddMessage(msg.sender,_amount,"Collect");
            }
        }
    }
