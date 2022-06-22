
    
    
    error InvalidCid(string cid);
    
    
    error InvalidSenderAddress(address sender);



function _addCid(string memory _cid) public {
            
       
        
        
        
        require(bytes(_cid).length > 0, "Cannot accept empty Cid");
        
        
        if(bytes(_cid).length < 0) 
        revert InvalidCid(_cid);
    
    
    
        
        
        
        require(msg.sender != address(0), "Cannot be called from 0x0 address.");
    
        
        if(msg.sender == address(0))
        revert InvalidSenderAddress(msg.sender);

function proceed();

}
    
