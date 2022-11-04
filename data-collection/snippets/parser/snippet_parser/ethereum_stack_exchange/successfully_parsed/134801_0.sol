contract ERC20token is  IERC20 {
   
    using SafeMath for uint256;
    using Address for address;
    
    mapping (address => uint256) public _balances;
    uint256 private _totalSupply;
    uint256 private _cap=10000;
    address public owner; 
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
        _mint(msg.sender, 2000);
        owner=msg.sender;
    }
    

    

    
    function _mint(address account, uint256 _amount) public virtual {
        require(account != address(0), "ERC20: mint to the zero address");
        
        _beforeTokenTransfer(address(0), account, _amount);

        _totalSupply = _totalSupply.add(_amount);
        _balances[account] = _balances[account].add(_amount);
       
    }
   
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {
         if (from == address(0)) { 
            require(totalSupply().add(amount) <= _cap, "ERC20Capped: cap exceeded");
        }
     }
}
