

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.6/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.6/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.6/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.6/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.6/contracts/token/ERC721/IERC721Receiver.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.6/contracts/security/ReentrancyGuard.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.6/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract TestCSh is ERC721URIStorage, Ownable, ReentrancyGuard, IERC721Receiver {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

     string baseURI;

    IERC721 immutable TESTSH;

    constructor(address TestShContract) ERC721("TestCSh", "TESTCSH") {

        TESTSH = IERC721(TestShContract);
    }
    
    function setBaseURI(string memory baseURI_) external {
        baseURI = baseURI_;
    }
    
    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function mintNft(address receiver, uint256 tokenId) internal returns (uint256) {
        

        
        _mint(receiver, tokenId);
        

        return tokenId;
    }

    function onERC721Received(address, address from, uint256 tokenId, bytes memory data) public virtual override nonReentrant returns (bytes4) {
        return this.onERC721Received.selector;
    }

    function swapVault(address from, uint256 tokenId) payable external returns (uint256){
        
        require(msg.sender==from, "Not Authorized");
        TESTSH.safeTransferFrom( from, address(this), tokenId);

        if (!_exists(tokenId)) {
            mintNft(from, tokenId);
        } else {
            safeTransferFrom(address(this), from, tokenId, "");
        }
    }

    function unswapVault(address to, uint256 tokenId) external returns (uint256){
        
        
    }

    
}
