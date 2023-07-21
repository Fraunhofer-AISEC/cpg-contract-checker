import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import './StringUtils.sol';


contract AssetAcquisition is Ownable, ERC20 {
    string private _tokenname = "MATTokens";
    string private _tokensymbol = "MAT";
    address public _owner;
    uint randNonce = 0;
    uint modulus = 0;
    uint maxWaitTime = 100;

    struct Assets {
        address owner;
        address sender;
        address payable receiver;
        uint256 amountleft;
        uint256 datesent;
    }

    uint256 public _totalSupply = 1000000;
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    mapping(address => Assets) public assetstore;
    Assets newasset;
    Assets[] public assetstorage;

    event AssetTransferAndMergerEvent(address payable _companyaddress, address payable _mergeraddress, uint256 amount);
    event AssetTransferMergerDetails(address owner, address sender, address payable receiver, uint256 amountleft, uint256 datesent);

    constructor(address __owner, string memory _tokenName, string memory _tokenSymbol) ERC20(_tokenName, _tokenSymbol) {
        _owner = __owner;
    }

 
} ```
   
