
pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract EcoNexus is ERC721 {
    uint256 private _tokenIdCounter;
    struct Asset {
        uint256 id;
        string name;
        string category;
        address owner;
        bool available;
    }

    mapping(uint256 => Asset) private _assets;

    constructor() ERC721("EcoNexusAsset", "ENA") {
        _tokenIdCounter = 1;
    }

    function createAsset(string memory name, string memory category) public {
        uint256 tokenId = _tokenIdCounter;
        _mint(msg.sender, tokenId);
        _assets[tokenId] = Asset(tokenId, name, category, msg.sender, true);
        _tokenIdCounter += 1;
    }

    function getAsset(uint256 tokenId) public view returns (Asset memory) {
        return _assets[tokenId];
    }

    function setAvailability(uint256 tokenId, bool available) public {
        require(msg.sender == _assets[tokenId].owner, "Only the owner can change availability.");
        _assets[tokenId].available = available;
    }

    function rentAsset(uint256 tokenId) public {
        require(_assets[tokenId].available, "Asset is not available for rent.");
        _assets[tokenId].available = false;
        safeTransferFrom(_assets[tokenId].owner, msg.sender, tokenId);
    }

    function returnAsset(uint256 tokenId) public {
        require(msg.sender == ownerOf(tokenId), "Only the renter can retrun the asset.");
        _assets[tokenId].available = true;
        safeTransferFrom(msg.sender, _assets[tokenId].owner, tokenId);
    }
}
