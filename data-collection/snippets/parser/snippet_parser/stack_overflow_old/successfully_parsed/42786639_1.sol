contract m {

    struct Message{
        address sender;
        address receiver;   
        uint msgContent;            
    } 

    Message[] all;

    function get(address from) internal returns (Message[]) {

        
        
        
        
        Message[] memory subMsgs = new Message[](all.length);
        uint count = 0;
        for (uint i=0; i<all.length ; i++)
        {
            if (all[i].sender == from)
            {
                subMsgs[count] = all[i];
                count++;
            }
        }
        return subMsgs; 
    }
} 
