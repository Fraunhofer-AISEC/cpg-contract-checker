function setClaimTimes(uint _claimtime, uint _claimchecktime) onlyOwner public returns(bool) {
        
        require(StartUp == true);
        
        ClaimTime = _claimtime;
        ClaimCheckTime = _claimchecktime;

        
        
        return(true);
    }
