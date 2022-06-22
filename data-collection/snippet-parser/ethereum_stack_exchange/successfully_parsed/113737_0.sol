pragma solidity ^0.6.12;




contract SHELTER is Context, IBEP20, Ownable {
    using SafeMath for uint256;
    using Address for address;

    mapping (address => uint256) private _rOwned;
    mapping (address => uint256) private _tOwned;
    mapping (address => mapping (address => uint256)) private _allowances;

    mapping (address => bool) private _isExcluded;
    address[] private _excluded;
   
    uint256 private constant MAX = ~uint256(0);
    uint256 private constant _tTotal = 8500000 * 10**20;
    uint256 private _rTotal = (MAX - (MAX % _tTotal));
    uint256 private _burnFeeTotal;
    uint256 private _charityFeeTotal;

    string private _name = 'SHELTER';
    string private _symbol = 'SHELTER';
    uint8 private _decimals = 18;

    constructor () public {
        _rOwned[msg.sender] = _rTotal;
        emit Transfer(address(0), msg.sender, _tTotal);
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

    function totalSupply() public view override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _tOwned[account];
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
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "BEP20: transfer amount exceeds allowance"));
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "BEP20: decreased allowance below zero"));
        return true;
    }

    function isExcluded(address account) public view returns (bool) {
        return _isExcluded[account];
    }

    function totalFees() public view returns (uint256) {
        return _burnFeeTotal;
    }

    function reflect(uint256 tAmount) public {
        address sender = _msgSender();
        require(!_isExcluded[sender], "Excluded addresses cannot call this function");
        (uint256 rAmount,,,) = _getSplit(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rTotal = _rTotal.sub(rAmount);
        _burnFeeTotal = _burnFeeTotal.add(tAmount);
    }

    function reflectionFromToken(uint256 tAmount, bool deductTransfecharityFee) public view returns(uint256) {
        require(tAmount <= _tTotal, "Amount must be less than supply");
        if (!deductTransfecharityFee) {
            (uint256 rAmount,,,) = _getSplit(tAmount);
            return rAmount;
        } else {
            (,uint256 rTransferAmount,,) = _getSplit(tAmount);
            return rTransferAmount;
        }
    }

    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0), "BEP20: approve from the zero address");
        require(spender != address(0), "BEP20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _transfer(address sender, address recipient, uint256 amount) private {
        require(sender != address(0), "BEP20: transfer from the zero address");
        require(recipient != address(0), "BEP20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");
        if (_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferFromExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && _isExcluded[recipient]) {
            _transferToExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferStandard(sender, recipient, amount);
        } else if (_isExcluded[sender] && _isExcluded[recipient]) {
            _transferBothExcluded(sender, recipient, amount);
        } else {
            _transferStandard(sender, recipient, amount);
        }
    }

    function _transferStandard(address sender, address recipient, uint256 tAmount) private {
        (uint256 totalAmount, uint256 tTransferAmount, uint256 charityFee, uint256 burnFee) = _getSplit(tAmount);
        address charityAddress = _charityAddress();
        address burnAddress = _burnAddress();
        _rOwned[sender] = _rOwned[sender].sub(tAmount);
        _rOwned[recipient] = _rOwned[recipient].add(tTransferAmount);
        _rOwned[charityAddress] = _rOwned[charityAddress].add(charityFee);
        _rOwned[burnAddress] = _rOwned[burnAddress].add(burnFee);
        _burnbabyburn(burnFee);
        _saveDoge(charityFee);
        emit Transfer(sender, recipient, tTransferAmount);
        emit Transfer(sender, charityAddress, charityFee);
        emit Transfer(sender, burnAddress, burnFee);
    }

    function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {
        (uint256 totalAmount, uint256 tTransferAmount, uint256 charityFee, uint256 burnFee) = _getSplit(tAmount);
        address charityAddress = _charityAddress();
        address burnAddress = _burnAddress();
        _rOwned[sender] = _rOwned[sender].sub(tAmount);
        _rOwned[recipient] = _rOwned[recipient].add(tTransferAmount);
        _rOwned[charityAddress] = _rOwned[charityAddress].add(charityFee);
        _rOwned[burnAddress] = _rOwned[burnAddress].add(burnFee);
        _burnbabyburn(burnFee);
        _saveDoge(charityFee);
        emit Transfer(sender, recipient, tTransferAmount);
        emit Transfer(sender, charityAddress, charityFee);
        emit Transfer(sender, burnAddress, burnFee);
    }

    function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {
        (uint256 totalAmount, uint256 tTransferAmount, uint256 charityFee, uint256 burnFee) = _getSplit(tAmount);
        address charityAddress = _charityAddress();
        address burnAddress = _burnAddress();
        _rOwned[sender] = _rOwned[sender].sub(tAmount);
        _rOwned[recipient] = _rOwned[recipient].add(tTransferAmount);
        _rOwned[charityAddress] = _rOwned[charityAddress].add(charityFee);
        _rOwned[burnAddress] = _rOwned[burnAddress].add(burnFee);
        _burnbabyburn(burnFee);
        _saveDoge(charityFee);
        emit Transfer(sender, recipient, tTransferAmount);
        emit Transfer(sender, charityAddress, charityFee);
        emit Transfer(sender, burnAddress, burnFee);
    }

    function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {
        (uint256 totalAmount, uint256 tTransferAmount, uint256 charityFee, uint256 burnFee) = _getSplit(tAmount);
        address charityAddress = _charityAddress();
        address burnAddress = _burnAddress();
        _rOwned[sender] = _rOwned[sender].sub(tAmount);
        _rOwned[recipient] = _rOwned[recipient].add(tTransferAmount);
        _rOwned[charityAddress] = _rOwned[charityAddress].add(charityFee);
        _rOwned[burnAddress] = _rOwned[burnAddress].add(burnFee);
        _burnbabyburn(burnFee);
        _saveDoge(charityFee);
        emit Transfer(sender, recipient, tTransferAmount);
        emit Transfer(sender, charityAddress, charityFee);
        emit Transfer(sender, burnAddress, burnFee);
    }

    function _burnbabyburn(uint256 burnFee) private {
        _burnFeeTotal = _burnFeeTotal.add(burnFee);
    }
    
    function _saveDoge(uint256 charityFee) private {
        _charityFeeTotal = _charityFeeTotal.add(charityFee);
    }

    function _getSplit(uint256 tAmount) private pure returns (uint256, uint256, uint256, uint256) {
        uint256 burnFee = tAmount.div(100);
        uint256 charityFee = tAmount.div(100);
        uint256 tTransferAmount = tAmount.sub(burnFee);
        tTransferAmount = tTransferAmount.sub(charityFee);
        return (tAmount, tTransferAmount, burnFee, charityFee);
    }

    function _getCurrentSupply() private view returns(uint256, uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;      
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (_rOwned[_excluded[i]] > rSupply || _tOwned[_excluded[i]] > tSupply) return (_rTotal, _tTotal);
            rSupply = rSupply.sub(_rOwned[_excluded[i]]);
            tSupply = tSupply.sub(_tOwned[_excluded[i]]);
        }
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }
}
