
pragma solidity ^0.8.0;
import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract STETTE is ERC721A, Ownable, ReentrancyGuard {
uint256 public mintPrice;
uint256 public maxSupply;
uint256 public maxPerWallet;

bool public isPublicMintEnabled;
string internal baseTokenURI;
mapping(address => uint256) public walletMints;
constructor() payable ERC721A("STETTE", "ST") {
    mintPrice = 20000000000000000; 
    maxSupply = 1000;
    maxPerWallet = 3;
    
}
function setIsPublicMintEnabled(bool _isPublicMintEnabled)
    external
    onlyOwner
{
    isPublicMintEnabled = _isPublicMintEnabled;
}
function setBaseTokenURI(string calldata _baseTokenURI) external onlyOwner {
    baseTokenURI = _baseTokenURI;
}
function tokenURI(uint256 tokenId_)
    public
    view
    override
    returns (string memory)
{
    require(_exists(tokenId_), "Token does not exist!");
    return
        string(
            abi.encodePacked(
                baseTokenURI,
                Strings.toString(tokenId_),
                ".json"
            )
        );
}
function withdraw() external onlyOwner nonReentrant {
    (bool success, ) = msg.sender.call{value: address(this).balance}("");
    require(success, "Transfer failed.");
}
function mint(uint256 quantity_) external payable {
    require(isPublicMintEnabled, "mint is not active");
    require(totalSupply() + quantity_ < maxSupply, "exceeded max sup");
    require(
        _numberMinted(msg.sender) + quantity_ <= maxPerWallet,
        "can not mint this many"
    );
    _safeMint(msg.sender, quantity_);
}
}