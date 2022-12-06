function swap(
        ICaller caller,
        ICaller.CallDescription[] calldata calls
    )
        external
        payable
        whenNotPaused
        returns (uint256 returnAmount)
    {
       
       
       
       caller.makeCalls{value: 1}(calls);
        
        . . . etc . . . 
    
