
pragma solidity ^0.8.15;





import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import {DefaultOperatorFilterer} from "./DefaultOperatorFilterer.sol";

error CallerIsNotUser();
error InvalidWhitelistAllocation();
error MintingTooMany();
error InsufficientFunds();
error MintingOverCollectionSize();
error SaleIsClosed();
error MintingOverWhitelistAllocation();
error InvalidProof();
error URIQueryForNonexistentToken();

contract NFT is ERC721A, Ownable, DefaultOperatorFilterer {

    using Strings for uint256;

    enum SaleState {
        CLOSED,
        WHITELIST,
        PUBLIC
    }

    uint256 public collectionSize = 1000;
    uint256 public publicMintPrice = 0.1 ether;
    uint256 public publicMaxMintAmount = 3;
    uint256 public whitelistAllocation = 500;
    uint256 public whitelistMintPrice = 0.05 ether;
    uint256 public whitelistMaxMintAmount = 1;
    bytes32 public whitelistMerkleRoot;
    string public unrevealedUri = "https://exampleUnrevealedUri.com";
    string public baseUri = "https://exampleUri.com/";
    bool public isRevealed;
    SaleState public saleState;

    
    modifier callerIsUser() {
        if (tx.origin != msg.sender) revert CallerIsNotUser();
        _;
    }

    constructor() ERC721A ("NFT", "NFT") {
        isRevealed = false;
        saleState = SaleState.CLOSED;
    }

    
    
    function publicMint(uint64 _mintAmount) public payable callerIsUser {
        if (_numberMinted(msg.sender) - _getAux(msg.sender) + _mintAmount > publicMaxMintAmount) revert MintingTooMany();
        if (totalSupply() + _mintAmount > collectionSize) revert MintingOverCollectionSize();
        if (saleState != SaleState.PUBLIC) revert SaleIsClosed();
        if (msg.value < _mintAmount * publicMintPrice) revert InsufficientFunds();

        _safeMint(msg.sender, _mintAmount);
    }

    
    
    
    function whitelistMint(bytes32[] calldata _merkleProof, uint64 _mintAmount) public payable callerIsUser {
        if (_getAux(msg.sender) + _mintAmount > whitelistMaxMintAmount) revert MintingTooMany();
        if (totalSupply() + _mintAmount > whitelistAllocation) revert MintingOverWhitelistAllocation();
        if (saleState != SaleState.WHITELIST) revert SaleIsClosed();
        if (msg.value < _mintAmount * whitelistMintPrice) revert InsufficientFunds();

        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        if(!(MerkleProof.verify(_merkleProof, whitelistMerkleRoot, leaf))) revert InvalidProof();

        _setAux(msg.sender, _getAux(msg.sender) + _mintAmount);
        _safeMint(msg.sender, _mintAmount);
    }

    
    
    
    function setCollectionSize(uint256 _collectionSize) public onlyOwner {
        collectionSize = _collectionSize;
    }

    
    
    
    function setPublicMintPrice(uint256 _publicMintPrice) public onlyOwner {
        publicMintPrice = _publicMintPrice;
    }

    
    
    
    function setPublicMaxMintAmount(uint256 _publicMaxMintAmount) public onlyOwner {
        publicMaxMintAmount = _publicMaxMintAmount;
    }

    
    
    
    function setWhitelistAllocation(uint256 _whitelistAllocation) public onlyOwner {
        if (_whitelistAllocation > collectionSize) revert InvalidWhitelistAllocation();
        whitelistAllocation = _whitelistAllocation;
    }

    
    
    
    function setWhitelistMintPrice(uint256 _whitelistMintPrice) public onlyOwner {
        whitelistMintPrice = _whitelistMintPrice;
    }

    
    
    
    function setWhitelistMaxMintAmount(uint256 _whitelistMaxMintAmount) public onlyOwner {
        whitelistMaxMintAmount = _whitelistMaxMintAmount;
    }

    
    
    
    function setWhitelistMerkleRoot(bytes32 _whitelistMerkleRoot) public onlyOwner {
        whitelistMerkleRoot = _whitelistMerkleRoot;
    }

    
    
    
    function setUnrevealedUri(string memory _unrevealedUri) public onlyOwner {
        unrevealedUri = _unrevealedUri;
    }

    
    
    
    function setBaseUri(string memory _baseUri) public onlyOwner {
        baseUri = _baseUri;
    }

    
    
    function toggleRevealed() public onlyOwner {
        isRevealed = !isRevealed;
    }

    
    
    
    function setSaleState(uint256 _saleState) public onlyOwner {
        saleState = SaleState(_saleState);
    }

    
    
    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        if (!_exists(_tokenId)) revert URIQueryForNonexistentToken();
        if (!isRevealed) return unrevealedUri;

        return string(abi.encodePacked(baseUri, _tokenId.toString(), ".json"));
    }

    
    
    function withdraw() public payable onlyOwner {
        (bool os,) = payable(owner()).call{value: address(this).balance}("");
        require(os);
    }

    

    function transferFrom(address from, address to, uint256 tokenId) public payable override onlyAllowedOperator(from) {
        super.transferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public payable override onlyAllowedOperator(from) {
        super.safeTransferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data)
        public
        payable
        override
        onlyAllowedOperator(from)
    {
        super.safeTransferFrom(from, to, tokenId, data);
    }
}
