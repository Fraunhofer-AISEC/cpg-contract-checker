pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract MyToken is ERC721, Ownable, ReentrancyGuard {
    using Strings for uint256;

    bytes32 public provenance;
    bytes32 public WlRoot;

    string baseURI = "";

    bool public whitelistSaleOnly = true;
    bool public paused = true;

    uint256 public MAX_SUPPLY = 10000;
    uint256 public cost = 0.12 ether;
    uint256 public wlCost = 0.1 ether;
    uint256 public maxMintAmount = 2;
    uint256 public maxWalletBalance = 2;
    uint256 public totalSupply = 1;

    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
    {
        for (uint256 i = 1; i < 157; i++) {
            if (totalSupply < 157) {
                _safeMint(msg.sender, i);
                totalSupply = i;
            }
        }
    }

    function isWhitelisted(bytes32[] memory proof, address claim)
        internal
        view
        returns (bool)
    {
        bytes32 leaf = keccak256(abi.encodePacked(claim));
        return MerkleProof.verify(proof, WlRoot, leaf);
    }

    function whitelistMint(uint256 _mintAmount, bytes32[] memory proof)
        public
        payable
    {
        uint256 _supply = totalSupply;
        require(
            _supply < MAX_SUPPLY && totalSupply + _mintAmount < MAX_SUPPLY,
            "Exceeds max supply"
        );
        require(!paused, "Sale is paused");
        require(_mintAmount > 0, "Must mint at least 1");
        require(_mintAmount < maxMintAmount + 1, "Cannot mint more than 2");
        require(
            balanceOf(msg.sender) < maxWalletBalance + 1,
            "One cannot own more than two"
        );
        require(
            isWhitelisted(proof, msg.sender),
            "Whitelist membership required"
        );
        require(msg.value >= wlCost * _mintAmount, "Insufficient funds");

        for (uint256 i = 1; i < _mintAmount + 1; i++) {
            _safeMint(msg.sender, _supply + i);
            _supply++;
        }
        totalSupply = _supply;
    }

    function mint(uint256 _mintAmount) public payable {
        uint256 _supply = totalSupply;
        require(
            _supply < MAX_SUPPLY && _supply + _mintAmount < MAX_SUPPLY,
            "Exceeds max supply"
        );
        require(!paused && !whitelistSaleOnly, "Paused or whitelisted");
        require(
            _mintAmount > 0 && _mintAmount < maxMintAmount + 1,
            "Mint amount must be within range"
        );
        require(
            balanceOf(msg.sender) < maxWalletBalance + 1,
            "Cannot exceed wallet maximum"
        );

        if (msg.sender != owner()) {
            require(
                msg.value >= cost * _mintAmount,
                "Insufficient ether in transaction"
            );
        }

        for (uint256 i = 1; i < _mintAmount + 1; i++) {
            _safeMint(msg.sender, _supply + 1);
            _supply++;
        }
        totalSupply = _supply;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );

        string memory currentBaseURI = _baseURI();

        
        return
            bytes(currentBaseURI).length > 0
                ? string(abi.encodePacked(currentBaseURI, tokenId.toString()))
                : "";
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function withdraw(address payable recipient) public onlyOwner {
        uint256 balance = address(this).balance;
        recipient.transfer(balance);
    }

    function setCost(uint256 _newCost) public onlyOwner {
        cost = _newCost;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function togglePause() public onlyOwner {
        paused = !paused;
    }

    function toggleWL() public onlyOwner {
        whitelistSaleOnly = !whitelistSaleOnly;
    }

    function setProvenanceHash(bytes32 provenanceHash) public onlyOwner {
        provenance = provenanceHash;
    }

    function setWLRoot(bytes32 WLRoot) public onlyOwner {
        WlRoot = WLRoot;
    }

    function updateMaxWalletBalance(uint256 _newWalletMax) public onlyOwner {
        maxWalletBalance = _newWalletMax;
    }

    function updateMaxMint(uint256 _newMaxMint) public onlyOwner {
        maxMintAmount = _newMaxMint;
    }
}
