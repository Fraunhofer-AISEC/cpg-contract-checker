
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract Test is ERC721A, Ownable, Pausable, ReentrancyGuard {
    using Strings for uint256;

    enum MintPhase {
        CLOSED,
        OGWL,
        PUBLIC
    }

    
    string public baseURI;

    
    uint256 public immutable maxSupply = 5555;
    uint256 public price = 0.033 ether;
    MintPhase public phase = MintPhase.CLOSED;

    mapping(address => bool) public ogClaimed;
    mapping(address => bool) public whiteListClaimed;
    mapping(address => bool) public publicFreeClaimed;

    
    bytes32 public ogMerkleRoot;
    uint256 public maxPerOgMinter = 4; 

    
    bytes32 public whitelistMerkleRoot;
    uint256 public maxPerWhitelistMinter = 3; 

    
    uint256 public maxPerFreePublicTx = 2; 
    uint256 public maxPerPublicTx = 4; 

    
    address private constant WALLET_B = 0x9193052B1843d7F2cAF37728756F062922eCd51d;
    address private constant WALLET_C = 0x9aBC658a4d3E82585Fb38e6D695a017e50D96564;

    constructor(
        string memory _initBaseUri
    ) ERC721A("Test", "Test") {
        setBaseURI(_initBaseUri);
    }

    

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function _startTokenId() internal view virtual returns (uint256) {
        return 1;
    }

    
    function _beforeTokenTransfers(
        address from,
        address to,
        uint256 tokenId,
        uint256 quantity
    ) internal override(ERC721A) whenNotPaused {
        super._beforeTokenTransfers(from, to, tokenId, quantity);
    }

    

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function setOgMerkleRoot(bytes32 _ogMerkleRoot) external onlyOwner {
        ogMerkleRoot = _ogMerkleRoot;
    }

    function setwhitelistMerkleRoot(bytes32 _whitelistMerkleRoot) external onlyOwner {
        whitelistMerkleRoot = _whitelistMerkleRoot;
    }

    function setMaxPerOgMinter(uint256 _maxPerOgMinter) external onlyOwner {
        maxPerOgMinter = _maxPerOgMinter;
    }

    function setmaxPerWhitelistMinter(uint256 _maxPerWhitelistMinter) external onlyOwner {
        maxPerWhitelistMinter = _maxPerWhitelistMinter;
    }

    function setMaxPerPublicTx(uint256 _maxPerPublicTx) external onlyOwner {
        maxPerPublicTx = _maxPerPublicTx;
    }

    function setPhase(MintPhase _mintPhase) external onlyOwner {
        phase = _mintPhase;
    }

    
    function setPrice(uint256 _price) external onlyOwner {
        price = _price;
    }

    
    function withdraw() external nonReentrant onlyOwner {
        uint256 currentBalance = address(this).balance;

        (bool successB, ) = payable(WALLET_B).call{ value: (currentBalance * 92) / 100 }("");
        require(successB, "Failed to send to B");

        (bool successC, ) = payable(WALLET_C).call{ value: (currentBalance * 8) / 100 }("");
        require(successC, "Failed to send to C");

    } 

    

    function numberMinted(address owner) public view returns (uint256) {
        return _numberMinted(owner);
    }

    function totalMinted() public view returns (uint256) {
        return _totalMinted();
    }

    function tokensOfOwner(address owner) public view returns (uint256[] memory) {
        uint256 holdingAmount = balanceOf(owner);
        uint256 currSupply = _currentIndex;
        uint256 tokenIdsIdx;
        address currOwnershipAddr;

        uint256[] memory list = new uint256[](holdingAmount);

        unchecked {
            for (uint256 i = _startTokenId(); i < currSupply; i++) {
                TokenOwnership memory ownership = _ownerships[i];

                if (ownership.burned) {
                    continue;
                }

                if (ownership.addr != address(0)) {
                    currOwnershipAddr = ownership.addr;
                }

                if (currOwnershipAddr == owner) {
                    list[tokenIdsIdx++] = i;
                }

                if (tokenIdsIdx == holdingAmount) {
                    break;
                }
            }
        }

        return list;
    }

    

    function _mintPresale(
        address buyer,
        uint256 quantity,
        bytes32[] calldata proof,
        bytes32 merkleRoot,
        uint256 limit
    ) internal {
        string memory payload = string(abi.encodePacked(buyer));
        require(_verify(merkleRoot, _leaf(payload), proof), "Address is not allowed during OGWL Sale");
        require(quantity < limit, "Exceeds OGWL per transaction limit");
        require(numberMinted(_msgSender()) + quantity < limit, "Exceeds total Pre-sale purchase limit");

        _safeMint(buyer, quantity);
    }

    function mintOg(uint256 quantity, bytes32[] calldata proof) external payable nonReentrant {
        require(phase == MintPhase.OGWL, "OG or WhiteList sale is not active");
        require(!ogClaimed[msg.sender], "Address has already been claimed!");

        _mintPresale(_msgSender(), quantity, proof, ogMerkleRoot, maxPerOgMinter);
    }

    function mintWhitelist(uint256 quantity, bytes32[] calldata proof) external payable nonReentrant {
        require(phase == MintPhase.OGWL, "OG or WhiteList sale is not active");
        require(!whiteListClaimed[msg.sender], "Address has already been claimed!");

        _mintPresale(_msgSender(), quantity, proof, whitelistMerkleRoot, maxPerWhitelistMinter);
    }

    function mintPublicFree(uint256 quantity) external payable nonReentrant {
        require(phase == MintPhase.PUBLIC, "Public sale is not active");
        require(totalMinted() + quantity <= 3000, "Exceeds Free Supply");
        require(quantity < maxPerFreePublicTx, "Exceeds max per transaction");
        require(!publicFreeClaimed[msg.sender], "Only 1 Free Per Wallet");

        _safeMint(_msgSender(), quantity);
    }

    function mintPublic(uint256 quantity) external payable nonReentrant {
        require(phase == MintPhase.PUBLIC, "Public sale is not active");
        require(totalMinted() + quantity <= maxSupply, "Exceeds max supply");
        require(quantity < maxPerPublicTx, "Exceeds max per transaction");
        require(price * quantity == msg.value, "Incorrect amount of funds provided");

        _safeMint(_msgSender(), quantity);
    }

    

    function _leaf(string memory payload) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(payload));
    }

    function _verify(
        bytes32 merkleRoot,
        bytes32 leaf,
        bytes32[] memory proof
    ) internal pure returns (bool) {
        return MerkleProof.verify(proof, merkleRoot, leaf);
    }

}
