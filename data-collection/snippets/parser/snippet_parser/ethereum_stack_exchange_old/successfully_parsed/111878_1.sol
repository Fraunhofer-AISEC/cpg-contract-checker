
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyERC721 is ERC721 {
  address owner;

  constructor(string memory name_, string memory symbol_, address owner_) ERC721(name_, symbol_) { 
    owner = owner_;
  }

  function safeMint(address to, uint256 tokenId) external {
    require(msg.sender == owner, "NOT_OWNER");

    _safeMint(to, tokenId, "");
  }

  function safeMint(address to, uint256 tokenId, bytes memory data) external {
    require(msg.sender == owner, "NOT_OWNER");
    
    _safeMint(to, tokenId, data);
  }
}
