pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

  contract NFTA is ERC721, Ownable {

     using Counters for Counters.Counter;
     Counters.Counter public _tokenIds;
     mapping (uint256 => string) public _tokenURIs;
     mapping(string => uint8) public hashes;

     constructor() public ERC721("NFTA", "NFT") {}

     function mintNFT(address recipient, string memory tokenURI)
          public onlyOwner
          returns (uint256)
      {
          _tokenIds.increment();

          uint256 newItemId = _tokenIds.current();
          _mint(recipient, newItemId);
          _setTokenURI(newItemId, tokenURI);

          return newItemId;
     }

     
     function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
     }    

  }
