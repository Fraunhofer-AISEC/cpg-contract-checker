
function lock() public returns (bool success)
{
    
    debugAddr = msg.sender;
    
    uint tempStamp = now;
    
    
    require(msg.sender == owner, "Only owner can lock contract.");
    
    
    
    
    
    
    
    LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
    
    
    locked = true;
    return true;
}
