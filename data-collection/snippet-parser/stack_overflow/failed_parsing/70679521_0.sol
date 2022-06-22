import "../openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";
import "../openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol";
import "../openzeppelin-contracts/contracts/math/SafeMath.sol";
import "../openzeppelin-contracts/contracts/utils/Address.sol";
import "../openzeppelin-contracts/contracts/utils/Counters.sol";
import "./ERC20Token.sol";

contract NFTtoken is ERC721 {
.
.
.
    ERC20Token Erc20Contract;

    constructor(address tokenAddress) ERC721("NC NFT example", "NCNFT") {
        owner = msg.sender;
        decimals = 0;
        Erc20Contract = ERC20Token(tokenAddress);
    }
function mint(string calldata nftName) external payable {
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);

        nftInfo[msg.sender].name = nftName;
        nftInfo[msg.sender].creator = msg.sender;

        allValidTokenIndex[newItemId] = allValidTokenIds.length;
        allValidTokenIds.push(newItemId);
        _tokenIds.increment();
    }
    function transferNFT(address from, address to, uint256 tokenId)  public returns (bool){
        transferFrom(from, to, tokenId);
        Erc20Contract.transferFrom(to, nftInfo[from].creator, 10);
    }
}
.
.
.
