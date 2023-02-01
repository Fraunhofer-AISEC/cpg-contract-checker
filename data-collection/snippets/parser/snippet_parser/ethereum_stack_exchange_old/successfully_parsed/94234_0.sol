 contract MyContract is ERC721, ReentrancyGuard {
    constructor() ERC721("MyToken", "TOK") public {
    }
    constructor () ReentrancyGuard() internal {
    }
 }
