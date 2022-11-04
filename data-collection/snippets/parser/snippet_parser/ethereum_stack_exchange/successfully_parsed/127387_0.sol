
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract DonatableNFT is ERC721, ERC721URIStorage, Ownable {
    mapping(string => uint8) existingURIs;
    uint256 public mintPrice = 0.01 ether;
    uint256 public maxSupply;
    bool public isMintEnabled;

    mapping(address => uint256) private mintedWallets;
    mapping(address => bool) private whiteListAddress;
    address[] public donationList;

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() payable ERC721("Test", "test") {
        maxSupply = 10;
    }

    function _whiteListAddress(address recipient) public onlyOwner {
        require(whiteListAddress[recipient] == false, "address already whitelisted");
        whiteListAddress[recipient] = true;
        donationList.push(recipient);
    }

    function getDonationList() public view returns (address[] memory) {
        return donationList;
    }

    function toggleIsMintEnabled() external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint256 maxSupply_) external onlyOwner {
        maxSupply = maxSupply_;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://";
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function isContentOwned(string memory uri) public view returns (bool) {
        return existingURIs[uri] == 1;
    }

    function donanteToMint(
        address donationRecipient,
        string memory metadataURI
    ) public payable returns (uint256) {
        require(isMintEnabled, 'minting not enabled');
        require (msg.value >= mintPrice, 'Sorry, not enough ETH.');
        require(maxSupply > _tokenIdCounter.current(), 'sold out');
        require(whiteListAddress[donationRecipient] == true, "address not available for donation");
        

        mintedWallets[msg.sender]++;
        uint256 newItemId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        existingURIs[metadataURI] = 1;

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, metadataURI);

        (bool success, ) = payable(donationRecipient).call{value: address(this).balance}("");
        require(success);

        return newItemId;
    }

     function withdraw() public payable onlyOwner {
        (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(success);
    }

}
