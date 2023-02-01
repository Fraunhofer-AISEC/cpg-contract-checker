mapping (address => uint256) private _rOwned;
mapping (address => uint256) private _tOwned;
mapping (address => mapping (address => uint256)) private _allowances;

mapping (address => bool) private _isExcluded;
address[] private _excluded;

uint256 public constant MAX = ~uint256(0);
uint256 private constant _ALLTOTALSUPPLY = 100000000000000 * 10**9;
uint256 private _rTotalSupply = (MAX - (MAX % _ALLTOTALSUPPLY));
uint256 public _tFeeTotal;

string private _name = 'Multi Verse';
string private _symbol = 'MULTI';
uint8 private _decimals = 12;

constructor () {
    _rOwned[_msgSender()] = _rTotalSupply;
    emit Transfer(address(0), _msgSender(), _ALLTOTALSUPPLY);
}

function name() public view returns (string memory) {
    return _name;
}

function symbol() public view returns (string memory) {
    return _symbol;
}

function decimals() public view returns (uint8) {
    return _decimals;
}

function totalSupply() public pure override returns (uint256) {
    return _ALLTOTALSUPPLY;
}

function balanceOf(address account) public view override returns (uint256) {
    if (_isExcluded[account]) return _tOwned[account];
    return tokenFromReflection(_rOwned[account]);
}

function transfer(address recipient, uint256 amount) public override returns (bool) {
    _transfer(_msgSender(), recipient, amount);
    return true;
}

function allowance(address owner, address spender) public view override returns (uint256) {
    return _allowances[owner][spender];
}

function approve(address spender, uint256 amount) public override returns (bool) {
    _approve(_msgSender(), spender, amount);
    return true;
}

function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
    _transfer(sender, recipient, amount);
    _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "IERC20AntiBots: transfer amount exceeds allowance"));
    return true;
}

function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
    _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
    return true;
}

function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
    _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "IERC20AntiBots: decreased allowance below zero"));
    return true;
}

function isExcluded(address account) public view returns (bool) {
    return _isExcluded[account];
}

function totalFees() public view returns (uint256) {
    return _tFeeTotal;
}

function reflect(uint256 tAmount) public {
    address sender = _msgSender();
    require(!_isExcluded[sender], "Excluded addresses cannot call this function");
    (uint256 rAmount,,,,) = _getValues(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _rTotalSupply = _rTotalSupply.sub(rAmount);
    _tFeeTotal = _tFeeTotal.add(tAmount);
}

function reflectionFromToken(uint256 tAmount, bool deductTransferFee) public view returns(uint256) {
    require(tAmount <= _ALLTOTALSUPPLY, "Amount must be less than supply");
    if (!deductTransferFee) {
        (uint256 rAmount,,,,) = _getValues(tAmount);
        return rAmount;
    } else {
        (,uint256 rTransferAmount,,,) = _getValues(tAmount);
        return rTransferAmount;
    }
}

function tokenFromReflection(uint256 rAmount) public view returns(uint256) {
    require(rAmount <= _rTotalSupply, "Amount must be less than total reflections");
    uint256 currentRate =  _getRate();
    return rAmount.div(currentRate);
}

function excludeAccount(address account) external onlyOwner() {
    require(!_isExcluded[account], "Account is not excluded");
    if(_rOwned[account] > 0) {
        _tOwned[account] = tokenFromReflection(_rOwned[account]);
    }
    _isExcluded[account] = true;
    _excluded.push(account);
}

function includeAccount(address account) external onlyOwner() {
    require(_isExcluded[account], "Account is not excluded");
    for (uint256 i = 0; i < _excluded.length; i++) {
        if (_excluded[i] == account) {
            _excluded[i] = _excluded[_excluded.length - 1];
            _tOwned[account] = 0;
            _isExcluded[account] = false;
            _excluded.pop();
            break;
        }
    }
}

function _approve(address owner, address spender, uint256 amount) private {
    require(owner != address(0), "IERC20AntiBots: approve from the zero address");
    require(spender != address(0), "IERC20AntiBots: approve to the zero address");

    _allowances[owner][spender] = amount;
    emit Approval(owner, spender, amount);
}

function _transfer(address sender, address recipient, uint256 amount) private {
    require(sender != address(0), "IERC20AntiBots: transfer from the zero address");
    require(recipient != address(0), "IERC20AntiBots: transfer to the zero address");
    require(amount > 0, "Transfer amount must be greater than zero");
    if (_isExcluded[sender] && !_isExcluded[recipient]) {
        _transferFromExcluded(sender, recipient, amount);
    } else if (!_isExcluded[sender] && _isExcluded[recipient]) {
        _transferToExcluded(sender, recipient, amount);
    } else if (!_isExcluded[sender] && !_isExcluded[recipient]) {
        _transferStandard(sender, recipient, amount);
    } else {
        _transferStandard(sender, recipient, amount);
    }
}

function _transferStandard(address sender, address recipient, uint256 tAmount) private {
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee) = _getValues(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);       
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
}

function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee) = _getValues(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);           
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
}

function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee) = _getValues(tAmount);
    _tOwned[sender] = _tOwned[sender].sub(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);   
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
}

function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee) = _getValues(tAmount);
    _tOwned[sender] = _tOwned[sender].sub(tAmount);
    _rOwned[sender] = _rOwned[sender].sub(rAmount);
    _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
    _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        
    _reflectFee(rFee, tFee);
    emit Transfer(sender, recipient, tTransferAmount);
}

function _reflectFee(uint256 rFee, uint256 tFee) public {
    _rTotalSupply = _rTotalSupply.sub(rFee);
    _tFeeTotal = _tFeeTotal.add(tFee);
}

function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256) {
    (uint256 tTransferAmount, uint256 tFee) = _getTValues(tAmount);
    uint256 currentRate =  _getRate();
    (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(tAmount, tFee, currentRate);
    return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee);
}

function _getTValues(uint256 tAmount) private pure returns (uint256, uint256) {
    uint256 tFee = tAmount.div(100).mul(5);
    uint256 tTransferAmount = tAmount.sub(tFee);
    return (tTransferAmount, tFee);
}

function _getRValues(uint256 tAmount, uint256 tFee, uint256 currentRate) private pure returns (uint256, uint256, uint256) {
    uint256 rAmount = tAmount.mul(currentRate);
    uint256 rFee = tFee.mul(currentRate);
    uint256 rTransferAmount = rAmount.sub(rFee);
    return (rAmount, rTransferAmount, rFee);
}

function _getRate() private view returns(uint256) {
    (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
    return rSupply.div(tSupply);
}

function _getCurrentSupply() private view returns(uint256, uint256) {
    uint256 rSupply = _rTotalSupply;
    uint256 tSupply = _ALLTOTALSUPPLY;      
    for (uint256 i = 0; i < _excluded.length; i++) {
        if (_rOwned[_excluded[i]] > rSupply || _tOwned[_excluded[i]] > tSupply) return (_rTotalSupply, _ALLTOTALSUPPLY);
        rSupply = rSupply.sub(_rOwned[_excluded[i]]);
        tSupply = tSupply.sub(_tOwned[_excluded[i]]);
    }
    if (rSupply < _rTotalSupply.div(_ALLTOTALSUPPLY)) return (_rTotalSupply, _ALLTOTALSUPPLY);
    return (rSupply, tSupply);
}
