
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.0/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.8.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.8.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.0/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Combat is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    ERC20 public tokenUsdt;
    uint256 public ethPrice = 0;
    uint256 public usdtPrice = 0;
    uint256 public maxSupply; 
    bool public isMintEnabled; 
    mapping(address=>uint256) public mintedWallets;


    constructor(address _tokenUsdt) ERC721("XXX", "QAZ") {
        maxSupply = 100;
        tokenUsdt = ERC20(_tokenUsdt);
    }

    function setToken(address _tokenUsdt) external onlyOwner {
        tokenUsdt = _tokenUsdt;
    }

    function setPrice(uint256 _ethPrice, uint256 _usdtPrice) external onlyOwner {
        ethPrice = _ethPrice;
        usdtPrice = _usdtPrice;
    }

    function buyMembershipUsdt() external payable {
        require(msg.value >= usdtPrice, "Price Error");
        tokenUsdt.safeTransferFrom(msg.sender, owner(), _amount);
        mintMembership();
    }

    function buyMembershipEth() external payable {
        require(msg.value >= ethPrice, "Price Error");
        mintMembership();
    }

    function mintMembership() internal {
        require(isMintEnabled, "Not For Sale");
        require(totalSupply() < maxSupply, "Sold Out");

        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    function setMintEnabled(bool isMintEnabled_) external onlyOwner {
        isMintEnabled = isMintEnabled_;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://bafybeiebgbvibloa3p3vge7ecxobwxxnuyg4pdozbcfjigfglhz2ogidq4/";
    }

    function setMaxSupply(uint256 maxSupply_) external onlyOwner{
        maxSupply = maxSupply_;
    }

    function withdraw() public onlyOwner {
        require(address(this).balance > 0, "Balance is 0");
        payable(owner()).transfer(address(this).balance);
    }

    function withdrawToken() external onlyOwner {
        uint256 tokenBalance = tokenUsdt.balanceOf(address(this));
        require(tokenBalance > 0, "Insufficient balance");
        tokenUsdt.safeTransfer(msg.sender, tokenBalance);
  }

  

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
