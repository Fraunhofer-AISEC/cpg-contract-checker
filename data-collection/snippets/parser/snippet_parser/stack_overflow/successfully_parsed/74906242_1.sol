
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract bachi is ERC721, Ownable {
    using Strings for uint256;

    uint256 public constant MAX_TOKENS = 999;
    uint256 private constant TOKENS_RESERVED = 5;
    uint256 public price = 9000000000000000;
    uint256 public constant MAX_MINT_PER_TX = 2;

    bool public isSaleActive;
    uint256 public totalsupply;
    mapping(address => uint256) private mintedperwallet;

    string public baseuri;
    string public baseExtension = ".json";

    constructor() ERC721("bachi", "bac") {
        
        baseuri = "ipfs://xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/";
        for (uint256 i = 1; i <= TOKENS_RESERVED; ++i) {
            _safeMint(msg.sender, i);
        }
        totalsupply = TOKENS_RESERVED;
    }
}
