pragma solidity ^0.7.0;

contract Function{
 
 function tokenOfOwner(address owner) public virtual returns (uint256[] memory) 
{

    uint256 amount = ERC721.balanceOf(owner);
    _ownerAmount = new uint256[](amount); 
    
    for(uint256 i = 0; i< amount ; i++)
    {  
        _ownerAmount[i] = 
    }
    return _ownerAmount;
}
  
   
}
