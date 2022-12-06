enter code here
uint256 private constant INITIAL_FRAGMENTS_SUPPLY = 10**15 * 10**_decimals;
    uint256 public swapThreshold = (rSupply * 10) / 10000;
    uint256 public rebase_count = 0;
    uint256 public rate;
    uint256 public _totalSupply;
    uint256 private constant MAX_UINT256 = ~uint256(0);
    uint256 private constant MAX_SUPPLY = ~uint128(0);
    uint256 private constant rSupply =
        MAX_UINT256 - (MAX_UINT256 % INITIAL_FRAGMENTS_SUPPLY);
