function withdraw_funds() public returns (bool) {
        if (getAccounts[msg.sender].amount > 0) {

            if(getAccounts[msg.sender].releasetime < now){
            msg.sender.transfer(getAccounts[msg.sender].amount);
            return (true);
        }}
        else {
            return(false);
        }
     }
