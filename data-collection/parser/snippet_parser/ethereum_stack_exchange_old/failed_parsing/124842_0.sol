using SafeMath for uint256;
mapping (address => uint256) private _rOwned;
mapping (address => uint256) private _tOwned;
mapping (address => mapping (address => uint256)) private _allowances;
mapping (address => bool) private _isExcludedFromFee;

uint256 private constant MAX = ~uint256(0);
uint256 private constant _tTotal = 100000 * 10**9;
uint256 private _rTotal = (MAX - (MAX % _tTotal));
uint256 private _tFeeTotal;

uint256 private _taxFeeOnTransfer = 9;    
uint256 private _taxFee = 5;
uint256 private _minSwap = 1 * 10**9;

string private constant _name = "MicroGramT3";
string private constant _symbol = "uGRAMT3";
uint8 private constant _decimals = 9;

address payable private _reserverAddress;
IUniswapV2Router02 public uniswapV2Router;
address public uniswapV2Pair;

bool private inSwap = false;
bool private swapEnabled = true;

modifier lockTheSwap {
    inSwap = true;
    _;
    inSwap = false;
}
constructor (address routerAddress, address payable feeAddress) {
    _rOwned[_msgSender()] = _rTotal;
    
    IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(routerAddress);
    uniswapV2Router = _uniswapV2Router;
    uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
        .createPair(address(this), _uniswapV2Router.WETH());

    _reserverAddress = feeAddress;

    _isExcludedFromFee[owner()] = true;
    _isExcludedFromFee[address(this)] = true;
    _isExcludedFromFee[_reserverAddress] = true;

    emit Transfer(address(0x0000000000000000000000000000000000000000), _msgSender(), _tTotal);
}
