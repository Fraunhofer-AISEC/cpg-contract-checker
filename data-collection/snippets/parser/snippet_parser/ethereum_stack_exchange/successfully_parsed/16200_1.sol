contract Fallback {

    event PayableCalled(bool called);
    bool crowdsaleClosed;

    function () payable {
        PayableCalled(true);   
        if (crowdsaleClosed) throw;
        uint amount = msg.value;
        
        
        
        
        
    }  
}
