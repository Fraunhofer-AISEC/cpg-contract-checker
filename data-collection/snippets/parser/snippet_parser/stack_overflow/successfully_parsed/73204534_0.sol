 
  pragma solidity ^0.8.0;

 import './ERC721.sol';

contract ERC721Enumerable is ERC721 {

    uint256[] private _allTokens;

    

    
    mapping(uint256 => uint256) private _allTokensIndex;
     
    
    mapping(uint256 => uint256[]) private _ownedTokens;
      
    
    mapping(uint256 => uint256) private _ownedTokensIndex;


    
    
    


    
    
    
    
    

    

    
    
    
    
    
    
    

    

    function _mint(address to, uint256 tokenId) internal override(ERC721) {
        super._mint(to, tokenId);
        
        
        
        _addTokensToAllTokenEnumeration(tokenId);   
        _addTokensToOwnerEnumeration(to, tokenId);
    }

    

    function _addTokensToAllTokenEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    
    

    function tokenByIndex(uint256 index) public view returns(uint256) {
        
        
        require(index < totalSupply(), 'global index is out of bounds');
        return _allTokens[index];
    }

     

     function totalSupply() public view returns(uint256) {
        return _allTokens.length;
    }

    function _addTokensToOwnerEnumeration(address to, uint256 tokenId) public {
       _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }
     
    }
