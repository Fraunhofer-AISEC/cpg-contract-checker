
pragma solidity >=0.7.0 <0.9.0;

import "erc721a/contracts/ERC721A.sol";  
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract xyz is ERC721A, Ownable {
    using SafeMath for uint256;
    using Strings for uint256;

    uint256 public maxSupply = 2555;
    uint256 public maxPerTx = 70;
    uint256 public freeMints = 555;
    uint256 public price = 0.02 ether;
    string public baseURI;
    string public baseExtension = ".json";
    string public notRevealedUri;

    constructor(
        string memory _initBaseURI,
        string memory _initNotRevealedUri
    ) ERC721A("xyz", "xyz") {
        setBaseURI(_initBaseURI);
        setNotRevealedURI(_initNotRevealedUri);
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function setNotRevealedURI(string memory _notRevealedURI) public onlyOwner {
        notRevealedUri = _notRevealedURI;
    }

    function setPrice(uint256 _newPrice) external onlyOwner {
        price = _newPrice * (1 ether);
    }

    function setmaxSupply(uint256 _newMaxSupply) public onlyOwner {
        maxSupply = _newMaxSupply;
    }

    function setMaxPerTx(uint256 _newMaxPerTx) public onlyOwner {
        maxPerTx = _newMaxPerTx;
    }

    function setFreeMints(uint256 _newFreeMints) public onlyOwner {
        freeMints = _newFreeMints;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function _startTokenId() internal pure override returns (uint256) {
        return 1;
    }
    
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: Nonexistent token");

        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), ".json")) : "";
    }

    function mint(uint256 tokens) external payable {
        require(totalSupply() + tokens <= maxSupply, "Minting would exceed max supply");
        require(tokens <= maxPerTx, "Must mint less than maxPerTx");
        require(tokens > 0, "Must mint at least one token");
        if (totalSupply() > freeMints) {
            require(price * tokens <= msg.value, "ETH amount is incorrect");
        }

        _safeMint(_msgSender(), tokens);
    }

    function withdrawAll() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "Insufficent balance");
        _withdraw(_msgSender(), address(this).balance);
    }

    function _withdraw(address _address, uint256 _amount) private {
        (bool success, ) = _address.call{value: _amount}("");
        require(success, "Failed to withdraw Ether");
    }
}

