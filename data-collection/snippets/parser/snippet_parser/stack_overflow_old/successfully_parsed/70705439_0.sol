pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";

contract myNFTwithBurn is ERC721, Ownable  {
    address externalTokenAddress = 0x01BE23585060835E02B77ef475b0Cc51aA1e0709; 
      uint256 amounttopay = 5; 
          IERC20 paymentToken = IERC20(externalTokenAddress); 
        address burnwallet = 0x000000000000000000000000000000000000dEaD; 

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
        using Strings for uint256;
        
        
        mapping (uint256 => string) private _tokenURIs;

        
        string private _baseURIextended;
        
    constructor() ERC721("NFTsWithBurn","NWB") {
    }
        function setBaseURI(string memory baseURI_) external onlyOwner() {
            _baseURIextended = baseURI_;
        }
        
        function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
            require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
            _tokenURIs[tokenId] = _tokenURI;
        }
        
        function _baseURI() internal view virtual override returns (string memory) {
            return _baseURIextended;
        }
        
        function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
            require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

            string memory _tokenURI = _tokenURIs[tokenId];
            string memory base = _baseURI();
            
            
            if (bytes(base).length == 0) {
                return _tokenURI;
            }
            
            if (bytes(_tokenURI).length > 0) {
                return string(abi.encodePacked(base, _tokenURI));
            }
            
            return string(abi.encodePacked(base, tokenId.toString()));
        }
function allowAccess() public
{
    paymentToken.approve(address(this), 5000000); 
}
function mintItem(address to, string memory tokenURI)
      public
      onlyOwner
      returns (uint256)
  {
    require(paymentToken.transfer(burnwallet, amounttopay),"transfer Failed"); 

      _tokenIds.increment();

      uint256 id = _tokenIds.current();
      _mint(to, id);
      _setTokenURI(id, tokenURI);

      return id;
  }

}
