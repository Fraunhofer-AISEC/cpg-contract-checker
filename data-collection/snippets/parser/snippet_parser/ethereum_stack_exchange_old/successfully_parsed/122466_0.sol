 function GetTotalNftAddress()
    public
    view
    returns (address[] memory)
{
    uint count; 
    uint256 total = totalSupply();
    address[] memory tokenIds = new address[](total);
    
    for (uint256 i=0; i < total; i++) {
            tokenIds[count] = ownerOf(i);
            count++;  
    }
       return tokenIds;
       
}
