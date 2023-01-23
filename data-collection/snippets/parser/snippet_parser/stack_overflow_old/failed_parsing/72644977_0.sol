contract Trail is IBEP20, Auth {
    using SafeMath for uint256;

    address WBNB = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
    address DEAD = 0x000000000000000000000000000000000000dEaD;
    address ZERO = 0x0000000000000000000000000000000000000000;
    address routerAddress = 0x; 

    string constant _name = "";
    string constant _symbol = "";
    uint8 constant _decimals = 9;

    uint256 _totalSupply = 10000000000000000 * (10 ** _decimals);
    uint256 public _maxTxAmount = _totalSupply; 
    uint256 public _maxWalletSize = (_totalSupply * 1) / 100; 

    mapping (address => uint256) _balances;
    mapping (address => mapping (address => uint256)) _allowances;

    mapping (address => bool) isFeeExempt;
    mapping (address => bool) isTxLimitExempt;
    mapping (address => bool) isTimelockExempt;
    mapping (address => bool) public isBot;

    uint256 liquidityFee = 1;
    uint256 devFee = 2; 
    uint256 marketingFee = 5;
    uint256 totalFee = 8;
    uint256 feeDenominator = 100;
    uint256 public _sellMultiplier = 1;
    
    address public marketingFeeReceiver = 0x;
    address public devFeeReceiver = msg.sender;

    IDEXRouter public router;
    address public pair;

    uint256 public launchedAt;
}
