pragma solidity ^0.8.9; 

import "@openzeppelin/contracts@4.8.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.3/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.8.3/security/Pausable.sol";
import "@openzeppelin/contracts@4.8.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.3/utils/Counters.sol";

contract Example_credential1 is ERC721, ERC721Enumerable, Pausable, Ownable {

    event Log(string message);

    
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    

    uint256 public MINT_PRICE = 0.005 ether;
    uint256 public MAX_SUPPLY = 10000; 

    
    constructor() ERC721("Example_credential1", "EC1") {
        _tokenIdCounter.increment();
    }

    
    function withdraw() public onlyOwner() {
        require(address(this).balance > 0, "Balance is zero");
        payable(owner()).transfer(address(this).balance);
    }


    
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }


    
    function safeMint(address to) public payable {
        require(msg.value >= MINT_PRICE, "not enough ether sent");
        require(totalSupply() <= MAX_SUPPLY, "No more tokens can be minted");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to,tokenId);
    }


    
    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}

