
oracleResponses[key] = ResponseInfo({ 
   requester: msg.sender, 
   isOpen: true}); 


struct ResponseInfo {
    address requester;                            
    bool isOpen;                                      
    mapping(uint8 => address[]) responses; 
}    

 mapping(bytes32 => ResponseInfo) private oracleResponses;
