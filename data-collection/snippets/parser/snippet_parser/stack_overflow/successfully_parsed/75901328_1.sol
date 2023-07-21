
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract AliveNatureERC721 is ERC721, ERC721Enumerable, ERC721URIStorage,Ownable ,ERC2981,  Pausable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;


    
    string private url;
    
    uint96 public commissionPercentage;
    
    address public commissionRecipient;

    struct ProjectData {
        string name;
        uint256 projectTokenId;
        string methodology;
        string area;
        string region;
        string emissionType;
        string uri;
        address creator;
        uint256 timeStamp;
    }

    struct RetireData {
        uint256 retireTokenId;
        address beneficiary;
        string retirementMessage;
        uint256 timeStamp;
        uint256 amount;
    }

    mapping (uint256 => ProjectData) private _projectData;
    mapping (uint256 => RetireData) private _retireData;




    constructor( string memory _MyToken, string memory _Symbol) ERC721(_MyToken, _Symbol) {
        commissionPercentage = 100;
        commissionRecipient = 0xE3506A38C80D8bA1ef219ADF55E31E18FB88EbF4;
        _setDefaultRoyalty(commissionRecipient, commissionPercentage);
    }

    function _baseURI() internal view override returns (string memory) {
        return url;
    }

    function pause() external onlyOwner  {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }


    function safeMint(address _to, string memory _uri, string memory _name,
    string memory _methodology, string memory _area, string memory _region,  string memory _emissionType, uint256 _tokenId) public whenNotPaused onlyOwner {
        uint256 tokenId = _tokenId;
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _uri);
        
        
        _projectData[tokenId] = ProjectData({
        projectTokenId : tokenId,
        uri : _uri,
        name : _name,
        methodology : _methodology,
        area : _area,
        region : _region,
        emissionType : _emissionType,
        creator : msg.sender,
        timeStamp : block.timestamp
        });
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
            if (from != address(0)) {
            address owner = ownerOf(tokenId);
            require(owner == msg.sender, "Only the owner of NFT can transfer or burn it");
        }
    }

    function _burn(uint256 tokenId) internal whenNotPaused override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function burnToken(uint256 tokenId, string memory _retirementMessage, uint256 _amount) public whenNotPaused {
        address owner = ownerOf(tokenId);
        require(owner == msg.sender, "Only the owner of NFT can burn it");
        _burn(tokenId);

        
        _retireData[tokenId] = RetireData({
        retireTokenId : tokenId,
        beneficiary : msg.sender,
        retirementMessage : _retirementMessage,
        timeStamp : block.timestamp,
        amount : _amount
        });
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC2981,  ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }



    function ownerOf(uint256 tokenId) public view virtual override(ERC721, IERC721) returns (address) {
        address owner = _ownerOf(tokenId);
        require(owner != address(0), "ERC721: invalid token ID");
        return owner;
    }

    function getProjectData(uint256 tokenId) public view returns (ProjectData memory) {
        return _projectData[tokenId];
    }

    function getRetireData(uint256 tokenId) public view returns (RetireData memory) {
        return _retireData[tokenId];
    }

    function getCommissionPercentage() public view returns (uint96) {
        return commissionPercentage;
    }

    function getCommissionRecipient() public view returns (address) {
        return commissionRecipient;
    }

}




