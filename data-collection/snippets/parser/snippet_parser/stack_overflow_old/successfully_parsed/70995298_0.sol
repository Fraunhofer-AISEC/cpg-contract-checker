contract NFT is ERC721, Ownable {
using SafeMath for uint256;

bool public  isActive = False;

uint256 public startingIndexBlock;

uint256 public startingIndex;
}
