function isValidBuyer(uint256 buyTokenQty, uint256 senderValue) public  constant returns (bool)
    {
        if(!isUserExist(msg.sender))
        {
            msg.sender.transfer(senderValue); 
            return false ; 
        }
        else 
        {
            return true ;
        }
    }
