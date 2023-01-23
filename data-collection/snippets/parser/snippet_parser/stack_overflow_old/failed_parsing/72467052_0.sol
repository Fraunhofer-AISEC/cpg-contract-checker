
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721Enumerable, Ownable {
  using Strings for uint256;
...

....
function payThisUser (address _to)public {
  int userBalance = balanceOf(_to);
  if (userBalance>0) _balance[_to]++;
} 
