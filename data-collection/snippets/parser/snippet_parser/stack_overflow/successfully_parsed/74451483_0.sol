
pragma solidity 0.8.17;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721, Ownable {

    uint256 public mintPrice;
    uint256 public maxPerWallet;
    uint256 public totalSupply;

    bool public isPublicMintEnabled;

    string internal baseTokenUri;
    address payable public withdrawWallet;

    mapping (address => uint256) public walletMints;
    mapping(uint256 => string) private _tokenURIs;

    Counters.Counter private _tokenIds;

    using Counters for Counters.Counter;
    using Strings for uint256;

    constructor() payable ERC721('NFT', 'NFT') {
        mintPrice = 0.0004 ether;
        maxPerWallet = 3;

        
    }

    function setIsPublicMintEnabled(bool isPublicMintEnabled_) external onlyOwner {
        isPublicMintEnabled = isPublicMintEnabled_;
    }

    function setBaseTokenUri(string calldata baseTokenUri_) external onlyOwner {
        baseTokenUri = baseTokenUri_;
    }

    function tokenURI(uint256 tokenId_) public view override returns (string memory) {
        require(_exists(tokenId_), 'Token does not exist!');
        return string(abi.encodePacked(baseTokenUri, Strings.toString(tokenId_), ".json"));
    }

    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual
    {
        _tokenURIs[tokenId] = _tokenURI;
    }

    function withDraw() external onlyOwner {
        (bool success, ) = withdrawWallet.call{ value: address(this).balance } ('');
        require(success, 'Withdraw failed');
    }

    function mint(string memory uri) public payable returns (uint256) {
        require(isPublicMintEnabled, 'Mint is not enabled');
        require(msg.value == mintPrice, 'Wrong mint value');
        require(walletMints[msg.sender] + 1 <= maxPerWallet, 'Exceed max quantity per wallet');

        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, uri);

        return newItemId;
    }

}
