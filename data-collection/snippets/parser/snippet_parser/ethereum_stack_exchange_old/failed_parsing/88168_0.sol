 struct Staking {
    uint value;
    uint stakingTime;
    uint reward;
}

mapping(address => Staking[]) public stakingInfo;


    
   function unstakeTokens(uint _withdrawAmount) public {
       uint balance;
       uint internalWithdrawAmount;
    
     
    for (uint i = 0; i < stakingInfo[msg.sender].length; i++) {
        balance = balance + stakingInfo[msg.sender][i].value;
    }
    
    
    require(balance > 0, "staking balance cannot be 0");
    
         
    for (uint i = 0; i < stakingInfo[msg.sender].length; i++) {
            
            delete stakingInfo[msg.sender][i];
        }
        
    }
    
    
    
    daiToken.transfer(msg.sender, balance);

    
    stakingBalance[msg.sender] = 0;

    
    isStaking[msg.sender] = false;
}
