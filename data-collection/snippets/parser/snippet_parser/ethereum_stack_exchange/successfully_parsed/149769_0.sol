    function burn() public onlyManager returns (bool) {
        icoState = getState();
        
        if (icoState != State.afterEnd) {
            revert Ico__StateShouldBeEnded();
        }
        
        balances[founder] = 0;
        return true;
    }
