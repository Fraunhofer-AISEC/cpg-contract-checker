(contract Bank)

function Put(uint _unlockTime)
    public
    payable
    {
        var acc = Acc[msg.sender];
        acc.balance += msg.value;
        acc.unlockTime = _unlockTime>now?_unlockTime:now;
        LogFile.AddMessage(msg.sender,msg.value,"Put");
    }

(contract Ripper)

function Put() public payable {
        bank_.Put.value(msg.value)(0);
    }
