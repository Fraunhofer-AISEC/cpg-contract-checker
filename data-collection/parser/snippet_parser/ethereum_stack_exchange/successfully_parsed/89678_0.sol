function getPlayerDepositHistory(address addr) public view returns (uint256[] memory, uint256[] memory, bool[] memory) {
        DepositHistory[] memory invests = users[addr].deposithistory;
        uint256[] memory baseTimes = new uint256[](invests.length);
        uint256[] memory values = new uint256[](invests.length);
        bool[] memory IsCollect = new bool[](invests.length);    

        uint256 i = 0;
        uint256 timeSpent = 0;
        while (i < invests.length){
            DepositHistory memory invest = invests[i];
            
    
      
                
        if (invest.lastDepositTime < invest.depositTime.add(PERIOD[0])){
                    uint256 remainedTime = PERIOD[0].sub(invest.lastDepositTime.sub(invest.depositTime));
                    if (remainedTime > 0){    
                    timeSpent=now.sub(invest.lastDepositTime);
                    if (remainedTime <= timeSpent){
                        timeSpent = remainedTime;
                        }
                    }
                   
            baseTimes[i] = invest.depositTime;
            values[i] = invest.amount;
            IsCollect[i] = invest.IsCollect;
        
                    
        }i++;  
           
        }
        

        return (baseTimes, values, IsCollect);
}
