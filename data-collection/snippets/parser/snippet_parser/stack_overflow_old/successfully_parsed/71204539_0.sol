  function GetAllNftOwnerAddress()
    public
    view
    returns (address[] memory) 
{
    uint256 total = totalSupply();
   
    address[] memory tokenIds;
 
    for (uint256 i; i < total; i++) {
       tokenIds[i] = ownerOf(i);
    }
    return tokenIds;
}
