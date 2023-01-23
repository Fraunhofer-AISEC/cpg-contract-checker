contract MyContract is ERC721, ReentrancyGuard {
    constructor() ERC721("MyToken", "TOK") ReentrancyGuard() public {
    }
 }
