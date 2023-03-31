
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFTmarketplace is ERC721URIStorage {
address public owner; 

constructor() ERC721("astro market", "astro"){
    owner = payable(msg.sender);
}

function mint(address to, uint tokenId) public {
    _mint(to, tokenId);
}
}

contract ConcreteNFTmarketplace is NFTmarketplace {






function onERC721Received(address, address, uint256, bytes memory) public virtual returns (bytes4) {
    return this.onERC721Received.selector;
} 
}
