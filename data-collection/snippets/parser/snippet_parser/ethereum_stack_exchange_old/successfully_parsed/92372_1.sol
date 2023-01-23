 import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

 contract MyNFT is ERC721 {
    constructor() ERC721("MyNFT", "MNFT") public {
    }
 }
