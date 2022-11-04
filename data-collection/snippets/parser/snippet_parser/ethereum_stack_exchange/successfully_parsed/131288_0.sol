    

    pragma solidity ^0.8.7;

    import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
    import "@openzeppelin/contracts/access/Ownable.sol";
    import "@openzeppelin/contracts/token/common/ERC2981.sol";
    import "erc721a/contracts/ERC721A.sol";

    contract SimpleContract is ERC721A, ERC2981, Ownable, ReentrancyGuard {

        uint256 public constant MAX_SUPPLY = 10000;
        uint256 public constant MAX_MINTS_WALLET = 1;

        string private _baseTokenURI;

        bool public isSaleOpen;

        mapping (address => uint256) public totalMints;

        constructor(string memory tokenData) ERC721A("Simple Contract", "SICO") {
            _baseTokenURI = tokenData;
        }    

        function toggleSaleOpen() external onlyOwner {
            isSaleOpen = !isSaleOpen;
        }

        modifier callerIsUser() {
            require(tx.origin == msg.sender, "Cannot be called by a contract");
            _;
        }

        function freeMint() external callerIsUser nonReentrant {
            require(isSaleOpen, "Sale not open");
            require(MAX_SUPPLY > totalSupply(), "Sold out");
            require((totalMints[msg.sender]) < MAX_MINTS_WALLET, "Only one free mint per wallet");
            _safeMint(msg.sender, 1);
            totalMints[msg.sender] += 1;
        }

        function _baseURI() internal view virtual override returns (string memory) {
            return _baseTokenURI;
        }

        function withdraw() external onlyOwner nonReentrant {
            (bool success, ) = msg.sender.call{value: address(this).balance}("");
            require(success, "Transfer failed");
        }

        

        
        function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721A, ERC2981) returns (bool) {
            return super.supportsInterface(interfaceId);
        }

        function setDefaultRoyalty(address receiver, uint96 feeNumerator) external onlyOwner {
            _setDefaultRoyalty(receiver, feeNumerator);
        }

        function deleteDefaultRoyalty() external onlyOwner {
            _deleteDefaultRoyalty();
        }
    }
