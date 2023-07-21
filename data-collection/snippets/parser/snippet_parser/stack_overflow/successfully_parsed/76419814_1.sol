    uint256 beforeBal = userEnergyBal [msg.sender];
        userEnergyBal[aproducer] -= aenergy;
        userEnergyBal [msg.sender] += aenergy;
        require(userEnergyBal[msg.sender]-beforeBal==aenergy,"Energy is not transfered yet");
