pragma solidity ^0.8.15;

import "@openzeppelin/contracts@4.6.0/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";
import "@openzeppelin/contracts@4.6.0/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts@4.6.0/utils/cryptography/draft-EIP712.sol";

contract test is ERC721, EIP712, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint256 rate = 1 * 10 **18; 
    
IERC20 public tokenAddress;

    constructor(address _tokenAddress) ERC721("test", "test") EIP712(SIGNING_DOMAIN, SIGNATURE_VERSION) {
        tokenAddress = IERC20(_tokenAddress);
    }

    function safeMint(address to, string memory uri) payable public  {
        require(msg.value >= rate, "Please increase your USDT amount. Please check the ticket price");
        tokenAddress.transferFrom(msg.sender, address(this), rate);
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri); 
    }
}