pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    IERC20 public tokenAddress;
    uint256 public rate = 100 * 10 ** 18;

    
  string public baseTokenURI;
  string public baseExtension = ".json";
  


    Counters.Counter private _tokenIdCounter;

    constructor(address _tokenAddress) ERC721("MyNFT", "MTK") {
        tokenAddress = IERC20(_tokenAddress);
        baseTokenURI = "https://bafybeiaxipkpgxxss4ji.ipfs.nftstorage.link/";
    }




      
  function _baseURI() internal view virtual override returns (string memory) {
    return baseTokenURI;
  }

  
  function setBaseTokenURI(string memory _baseTokenURI) public {
    baseTokenURI = _baseTokenURI;
  }

 
    function safeMint() public {
        tokenAddress.transferFrom(msg.sender, address(this), rate);
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);


    }

    function withdrawToken() public onlyOwner {
        tokenAddress.transfer(msg.sender, tokenAddress.balanceOf(address(this)));
    }
}           ``` 

        I tried adding json parameter but not works can you help me and edit a function or sort out what issue is 



 
