        pragma solidity ^0.8.0;
        
        
        import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
        import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
        import "@openzeppelin/contracts/utils/Counters.sol";
        
        contract Cause is ERC721URIStorage {
            
            using Counters for Counters.Counter;
        
            Counters.Counter private _tokenIds;
        
            
        
            address contractAddress;
        
            constructor(address allcauseAddress)
                ERC721("Partnerverse Tokens", "PNVT")
            {
                contractAddress = allcauseAddress;
            }
        
            
            
            function createToken(string memory tokenURI) public returns (uint256) {
                
                _tokenIds.increment();
                uint256 newCauseId = _tokenIds.current();
        
                _mint(msg.sender, newCauseId); 
                _setTokenURI(newCauseId, tokenURI); 
                setApprovalForAll(contractAddress, true); 
        
                
                return newCauseId;
            }
        }
 
