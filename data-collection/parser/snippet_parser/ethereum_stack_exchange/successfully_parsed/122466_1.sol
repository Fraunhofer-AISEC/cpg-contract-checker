function getTransferNftAddress()
    public
    view
    returns (address[] memory )
{
    uint count; 

    uint256 total = totalSupply();
    address onwer = msg.sender;
    address[] memory token = new address[](getCounting());
       
    for (uint256 i=0; i < total; i++) {            
        if(ownerOf(i) != onwer){
          token[count] = ownerOf(i);   
          count++;   
        }

    }
    
    return token;
}
