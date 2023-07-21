    
    
    pragma solidity ^0.8.0;
    
    import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
    
    
    contract GameItem is ERC721URIStorage {
        
        
        uint256 private _tokenIds;
    
        constructor() ERC721("GameItem", "ITM") {}
    
        function awardItem(address player, string memory tokenURI)
            public
            returns (uint256)
        {
            
            _mint(player, newItemId);
            _setTokenURI(newItemId, tokenURI);
    
            
            _tokenIds++; 
            return newItemId;
        }
    }
