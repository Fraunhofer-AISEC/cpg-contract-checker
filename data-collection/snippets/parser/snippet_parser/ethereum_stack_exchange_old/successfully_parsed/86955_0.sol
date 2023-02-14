uint256 public constant decimals = 9;

uint256 private constant DECIMALS = 9;
uint256 private constant MAX_UINT256 = ~uint256(0);
uint256 private constant INITIAL_FRAGMENTS_SUPPLY = 10**9 * 10**DECIMALS;

uint256 private constant TOTAL_GONS = MAX_UINT256 - (MAX_UINT256 % INITIAL_FRAGMENTS_SUPPLY);

uint256 private constant MAX_SUPPLY = ~uint128(0);  

uint256 private _totalSupply;
uint256 private _gonsPerFragment;
mapping(address => uint256) private _gonBalances;

mapping (address => mapping (address => uint256)) private _allowedFragments;
