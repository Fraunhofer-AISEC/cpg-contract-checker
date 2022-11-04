function checkStakeByIndex(uint _stakeIndexNo) public view returns(
    string memory,                                                          
    bool,                                                                   
    bool,                                                                   
    uint,                                                                   
    uint,                                                                   
    uint                                                                    
    ){return(
    "1 - WU | 2 - AR | 3 - AS | 4 - TOS | 5 - TOR :",                       
    allUserStakes[msg.sender]._wasUnstaked[_stakeIndexNo],                  
    allUserStakes[msg.sender]._autoRenewal[_stakeIndexNo],                  
    allUserStakes[msg.sender]._amountStaked[_stakeIndexNo],                 
    allUserStakes[msg.sender]._timeOfStake[_stakeIndexNo],                  
    allUserStakes[msg.sender]._timesOfRelease[_stakeIndexNo]);              
    }
