pragma solidity ^0.8.9;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

abstract contract NFTmarketplace is ERC721URIStorage, IERC721Receiver {

    constructor() ERC721("astro market", "astro"){
        owner = payable(msg.sender);
    }
}

contract ConcreteNFTmarketplace is NFTmarketplace {

    function onERC721Received(address _from, uint256 _tokenId) external  {
        
        transferFrom(_from, address(this), _tokenId);
    }
}
