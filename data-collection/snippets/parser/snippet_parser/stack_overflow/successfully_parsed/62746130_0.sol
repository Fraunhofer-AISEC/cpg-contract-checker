function checkSubscribed() public view returns(bool){
        if(block.timestamp>subscriptionPeriod[msg.sender]){
            return false;
        }
        else{
             return true;
        }
     
    }
