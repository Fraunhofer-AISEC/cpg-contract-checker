import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract MyVideos is ERC1155 {
    uint256 public constant Video1 = 0;
    uint256 public constant Video2 = 1;
    uint256 public constant Video3 = 2;

    constructor() public ERC1155("https://video/api/item/{id}.json") {
        _mint(msg.sender, Video1, 100, "IPFS hash");
        _mint(msg.sender, Video2, 1000, "IPFS hash");
        _mint(msg.sender, Video3, 1, "IPFS hash");
    }
}
