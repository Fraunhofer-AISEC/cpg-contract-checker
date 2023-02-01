import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

    contract Bear is ERC721, Ownable, PaymentSplitter, ReentrancyGuard{
    uint private teamLength;
    constructor(
            address[] memory _team,
            uint[] memory _teamShares,
            string memory _initBaseURI,
            string memory _notRevealedURI,
            bytes32 _merkleRoot) ERC721("Bear", "BR")
            PaymentSplitter(_team, _teamShares) {
            setBaseURI(_initBaseURI);
            teamLength = _team.length;
            notRevealedURI = _notRevealedURI;
            merkleRoot = _merkleRoot;
        }
    
        modifier callerIsUser() {
            require(tx.origin == msg.sender, "Cannot be called by a contract");
            _;
        }
    
    
        function mint(address _account, uint256 _quantity, bytes32[] calldata _proof) external payable callerIsUser{
            uint price = PRICE;
            require(price != 0, "price connot be 0");
            
            require(isWhiteListed(msg.sender, _proof), "Not on the whitelist");
            
            require(msg.value >= (PRICE * _quantity), "not enough funds ");
            _safeMint(_account, _quantity);
        }
    
        function releaseAll() external onlyOwner nonReentrant() {
                for(uint i = 0; i < teamLength; i++) {
                    release(payable(payee(i)));
                }
            }
    }
