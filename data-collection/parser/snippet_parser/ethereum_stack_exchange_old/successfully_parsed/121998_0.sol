
contract NFTMinter is ERC721, Ownable, ReentrancyGuard {
    using SafeMath for *;
    using SafeERC20 for IERC20;
    using Address for address;
    using Strings for uint256;

    
    string private _name;

    
    string private _symbol;

    
    mapping(uint256 => address) private _owners;

    
    mapping(address => uint256) private _balances;

    
    mapping(uint256 => address) private _tokenApprovals;

    
    mapping(address => mapping(address => bool)) private _operatorApprovals;
}