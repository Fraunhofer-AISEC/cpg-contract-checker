 mapping (address=>bool) public exceptions;
 function send_with_exceptions2(address[] recipients) public {
        for(uint i=0;i<recipients.length;i++){
            if(!exceptions[recipients[i]]){
                
            }
        }
    }
