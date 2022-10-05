pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Testing is ERC721A, Ownable {
    uint256 MAX_MINTS = 69;
    uint256 MAX_SUPPLY = 10021;
    uint256 public mintRate = 0.0069 ether;

    string public baseURI = "ipfs://QmbSyBfCGoDBGofbzR9WKrcyPiWMhVVgtkuLFMtwNt7XtL/";

    constructor() ERC721A("Testing", "Test") {}

    function mint(uint256 quantity) external payable {
        
        require(quantity + _numberMinted(msg.sender) <= MAX_MINTS, "Exceeded the limit");
        require(totalSupply() + quantity <= MAX_SUPPLY, "Not enough tokens left");
        require(msg.value >= (mintRate * quantity), "Not enough ether sent");
        _safeMint(msg.sender, quantity);
    }

    function withdraw() external payable onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function setMintRate(uint256 _mintRate) public onlyOwner {
        mintRate = _mintRate;
    }
}
