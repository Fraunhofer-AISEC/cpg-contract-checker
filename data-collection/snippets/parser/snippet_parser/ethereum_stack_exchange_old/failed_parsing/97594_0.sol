import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract myERC721Contract is Context, Ownable, ERC165, IERC721, IERC721Metadata, IERC721Enumerable {

  …code…

}
