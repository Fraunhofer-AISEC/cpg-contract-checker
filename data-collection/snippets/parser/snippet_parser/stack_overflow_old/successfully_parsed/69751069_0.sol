import "./ERC721.sol";
import "./Counters.sol";

contract Main is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter internal _tokenIds;
    address payable internal admin; 

    constructor() ERC721("MyToken", "TOKEN") {
        admin = payable(msg.sender);
    }
}
