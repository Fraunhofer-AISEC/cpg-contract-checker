import "erc721a/contracts/ERC721A.sol";

contract test123 is ERC721A {

    string public baseUri;
    address public owner;

    constructor() ERC721A("test123", "test123") {
        owner = msg.sender;
    }

    function mint(uint256 quantity) external payable {
        
        _mint(msg.sender, quantity);
    }

    function _baseURI() override internal view virtual returns (string memory) {
        return baseUri;
    }

    function getBaseURI(string memory _baseUri) external onlyOwner {
        baseUri = _baseUri;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Not owner");
        _;
    }

}
