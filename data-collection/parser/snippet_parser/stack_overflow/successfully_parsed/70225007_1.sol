import "./IERC-20.sol";

contract CpayCoin is IERC20 {
    
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    
    uint256 private _totalSupply;
    uint256 private _tokenPrice;

    
    string private _name;
    string private _symbol;

    
    address _minter;

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 totalSupply_
    ) {
        _minter = msg.sender;
        _balances[_minter] = _totalSupply;
        _tokenPrice = 10**15 wei;
        _name = name_;
        _symbol = symbol_;
        _totalSupply = totalSupply_;
    }

    
    modifier onlyMinter() {
        require(msg.sender == _minter, "Only Minter can Mint!");
        _;
    }

    modifier enoughBalance(address adr, uint256 amount) {
        require(_balances[adr] >= amount, "Not enough Balance!");
        _;
    }

    modifier enoughValue(uint256 amount) {
        require(msg.value == amount * _tokenPrice, "Not enough Value!");
        _;
    }

    modifier checkZeroAddress(address adr) {
        require(adr != address(0), "ERC20: mint to the zero address");
        _;
    }

    
    function name() public view virtual returns (string memory) {
        return _name;
    }

    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address adr)
        public
        view
        virtual
        override
        returns (uint256)
    {
        return _balances[adr];
    }

    function _mint(address account, uint256 amount)
        internal
        virtual
        onlyMinter
        checkZeroAddress(account)
    {
        _totalSupply += amount;
        _balances[account] += amount;

        emit Transfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        virtual
        onlyMinter
        checkZeroAddress(account)
    {
        uint256 accountBalance = _balances[account];
        unchecked {
            _balances[account] = accountBalance - amount;
        }

        _totalSupply += amount;
        emit Transfer(account, address(0), amount);
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        uint256 senderBalance = _balances[sender];
        require(
            senderBalance >= amount,
            "ERC20: transfer amount exceeds balance"
        );

        unchecked {
            _balances[sender] = senderBalance - amount;
        }

        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
}
