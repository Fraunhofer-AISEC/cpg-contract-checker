contract ERC20 is Context, IERC20, IERC20Metadata, IPTK{

    string private name_;
    string private symbol_;

    uint8 private decimals_;
    uint8 private withdrawnDaily_;
    uint256 private totalSupply_;   

    mapping(address => uint256) private withdraw_;

    mapping(address => uint256) private balances_;

    mapping(address => mapping (address => uint256)) private allowed_;


   constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupplyMinted, uint8 _withdrawnDaily) {
    name_ = _name;
    symbol_ = _symbol;
    decimals_ = _decimals;
    totalSupply_ = _totalSupplyMinted;
    withdrawnDaily_ = _withdrawnDaily;
    }
}