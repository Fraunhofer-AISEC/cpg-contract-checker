contract XX {
    bool mutexFlag;

    function untrustedCall(address payable _untrusted) public {
        require(mutexFlag == false, "No reentry!");
        
        mutexFlag = true; 
        (bool success, ) = _untrusted.call.value(xxx)(""); 
        mutexFlag = false;
        require(success, "Transfer failed!");

        
    }
}
