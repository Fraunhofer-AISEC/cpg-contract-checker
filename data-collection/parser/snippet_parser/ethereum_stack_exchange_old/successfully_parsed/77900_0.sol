function bet() public payable
    {
        if ((random()%2==1) && (msg.value == 1 ether))
        {
            if (!msg.sender.call.value(2 ether)())
                throw;
        }
    }
