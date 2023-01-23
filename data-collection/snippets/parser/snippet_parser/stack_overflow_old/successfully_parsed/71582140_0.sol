pragma solidity ^0.8.0;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/1001-digital/erc721-extensions/blob/main/contracts/RandomlyAssigned.sol";

contract CrazyBananaUnion is ERC721, Ownable, RandomlyAssigned {
  using Strings for uint256;
  uint256 public currentSupply = 0;

  string public baseURI = "https://ipfs.io/ipfs/QmfRTLygidHaaYHKkhcNojm7YdEEmX/";

  constructor() 
ERC721("CrazyBananaUnion", "CBU")
RandomlyAssigned(10000,1) 
{
   for (uint256 a = 1; a <= 8000; a++) {
        mint(msg.sender);
    }
}

  function _baseURI() internal view virtual override returns (string memory) {
return baseURI;
  }


  function mint (address _to)
  public
  payable
  {
  require( tokenCount() + 1 <= totalSupply(), "YOU CAN'T MINT MORE THAN MAXIMUM SUPPLY");
  require( availableTokenCount() - 1 >= 0, "YOU CAN'T MINT MORE THAN AVALABLE TOKEN COUNT"); 
  require( tx.origin == msg.sender, "CANNOT MINT THROUGH A CUSTOM CONTRACT");

  if (msg.sender != owner()) {  
    require( msg.value >= 0.001 ether);
  }
  
  uint256 id = nextToken();
    _safeMint(_to, id);
    currentSupply++;
  }

  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
require(
  _exists(tokenId),
  "ERC721Metadata: URI query for nonexistant token"
);

string memory currentBaseURI = _baseURI();
return bytes(currentBaseURI).length > 0
    ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), ".json"))
    : "";
  }

  function withdraw() public payable onlyOwner {
require(payable(msg.sender).send(address(this).balance));
  }
}
