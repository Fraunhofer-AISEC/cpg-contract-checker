contract BYYCC is ERC721, Ownable {

    using SafeMath for uint256;

    string public BAYC_PROVENANCE = "";

    uint256 public startingIndexBlock;

    uint256 public startingIndex;

    uint256 public constant apePrice = 80000000000000000; 

    uint public constant maxApePurchase = 20;

    uint256 public MAX_APES;

    bool public saleIsActive = false;

    uint256 public REVEAL_TIMESTAMP;

    constructor(string memory name, string memory symbol, uint256 maxNftSupply, uint256 saleStart) ERC721(name, symbol) {
        MAX_APES = maxNftSupply;
        REVEAL_TIMESTAMP = saleStart + (86400 * 9);
    }
}