pragma solidity ^0.8.10;




interface IERC20 {
    
    function totalSupply() external view returns (uint256);

    
    function balanceOf(address account) external view returns (uint256);

    
    function transfer(address recipient, uint256 amount) external returns (bool);

    
    function allowance(address owner, address spender) external view returns (uint256);

    
    function approve(address spender, uint256 amount) external returns (bool);

    
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


interface IERC20Metadata is IERC20 {
    
    function name() external view returns (string memory);

    
    function symbol() external view returns (string memory);

    
    function decimals() external view returns (uint8);
}


abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}


contract AIDtoken is Context, IERC20, IERC20Metadata {

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;

    address private _owner;

    address public _teamVestingWallet; 
    address public _devWallet; 
    address public _charityWallet; 
    address public _foundationWallet1; 
    address public _foundationWallet2; 
    address public _liquidityWallet; 

    uint public deployTime;

    uint private _teamVestingWalletLimitedTime;
    uint private _devWalletLimitedTime;
    uint private _charityWalletLimitedTime;
    uint private _foundationWallet1LimitedTime;
    uint private _foundationWallet2LimitedTime;

    uint256 private _teamVestingWalletLimitedAmount;
    uint256 private _devWalletLimitedAmount;
    uint256 private _charityWalletLimitedAmount;
    uint256 private _foundationWallet1LimitedAmount;
    uint256 private _foundationWallet2LimitedAmount;

    
    
    constructor(uint256 totalSupply_) {
        _owner = msg.sender;

        deployTime = block.timestamp;

        _name = "myToken";
        _symbol = "myT";
        _totalSupply = totalSupply_;
        _teamVestingWallet = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        _devWallet = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
        _charityWallet = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
        _foundationWallet2 = 0x17F6AD8Ef982297579C203069C1DbfFE4348c372;
        _liquidityWallet = 0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678;
        _balances[_teamVestingWallet] = _totalSupply*10**18*11/100;
        _balances[_devWallet] = _totalSupply*10**18*10/100;
        _balances[_charityWallet] = _totalSupply*10**18*12/100;
        _balances[_foundationWallet1] = _totalSupply*10**18*10/100;
        _balances[_foundationWallet2] = _totalSupply*10**18*10/100;
        _balances[_liquidityWallet] = _totalSupply*10**18*11/100;

        emit Transfer(address(0), _teamVestingWallet, _totalSupply*10**18*27/100);
        emit Transfer(address(0), _devWallet, _totalSupply*10**18*10/100);
        emit Transfer(address(0), _charityWallet, _totalSupply*10**18*3/100);
        emit Transfer(address(0), _foundationWallet1, _totalSupply*10**18*10/100);
        emit Transfer(address(0), _foundationWallet2, _totalSupply*10**18*10/100);
        emit Transfer(address(0), _liquidityWallet, _totalSupply*10**18*40/100);
    }
    
    
    function limitWallet(uint256 amount, uint limitTime) external virtual returns (bool) {
        require(msg.sender == _teamVestingWallet || msg.sender == _devWallet || msg.sender == _charityWallet || msg.sender == _foundationWallet1 || msg.sender == _foundationWallet2);
        
        if (msg.sender == _teamVestingWallet) {
            require(amount >= _teamVestingWalletLimitedAmount && limitTime + block.timestamp >= _teamVestingWalletLimitedTime);
            _teamVestingWalletLimitedAmount = amount;
            _teamVestingWalletLimitedTime = limitTime + block.timestamp;
        }
        if (msg.sender == _devWallet) {
            require(amount >= _devWalletLimitedAmount && limitTime + block.timestamp >= _devWalletLimitedTime);
            _devWalletLimitedAmount = amount;
            _devWalletLimitedTime = limitTime + block.timestamp;
        }
        if (msg.sender == _charityWallet) {
            require(amount >= _charityWalletLimitedAmount && limitTime + block.timestamp >= _teamVestingWalletLimitedTime);
            _charityWalletLimitedAmount = amount;
            _teamVestingWalletLimitedTime = limitTime + block.timestamp;
        }
        if (msg.sender == _foundationWallet1) {
            require(amount >= _foundationWallet1LimitedAmount && limitTime + block.timestamp >= _foundationWallet1LimitedTime);
            _foundationWallet1LimitedAmount = amount;
            _foundationWallet1LimitedTime = limitTime + block.timestamp;
        }
        if (msg.sender == _foundationWallet2) {
            require(amount >= _foundationWallet2LimitedAmount && limitTime + block.timestamp >= _foundationWallet2LimitedTime);
            _foundationWallet2LimitedAmount = amount;
            _foundationWallet2LimitedTime = limitTime + block.timestamp;
        }
        return true;
    }
    
    function __amount() external view virtual returns (uint256) {
        return _devWalletLimitedAmount;
    }
    function __time() external view virtual returns (uint) {
        return _devWalletLimitedTime;
    }
    function __blockTimestamp() external view virtual returns (uint) {
        return block.timestamp;
    }

    function canWalletSpendAmountNow(address walletToInvestigate, uint256 amount) internal virtual returns(bool) {
        if (walletToInvestigate == _teamVestingWallet && ((_teamVestingWalletLimitedTime <= block.timestamp && _teamVestingWalletLimitedAmount <= amount) || _teamVestingWalletLimitedAmount <= amount)) {
            return true;
        }
        if ((walletToInvestigate == _devWallet && _devWalletLimitedTime <= block.timestamp) || (walletToInvestigate == _devWallet && _devWalletLimitedAmount <= amount)) {
            return true;
        }
        if (walletToInvestigate == _charityWallet && ((_charityWalletLimitedTime <= block.timestamp && _charityWalletLimitedAmount <= amount) || _charityWalletLimitedAmount <= amount)) {
            return true;
        }
        if (walletToInvestigate == _foundationWallet1 && ((_foundationWallet1LimitedTime <= block.timestamp && _foundationWallet1LimitedAmount <= amount) || _foundationWallet1LimitedAmount <= amount)) {
            return true;
        }
        if (walletToInvestigate == _foundationWallet2 && ((_foundationWallet2LimitedTime <= block.timestamp && _foundationWallet2LimitedAmount <= amount) || _foundationWallet2LimitedAmount <= amount)) {
            return true;
        }
        else return false;
    }
    
    function __canWalletSpendAmountNow(address walletToInvestigate, uint256 amount) external view virtual returns(bool) {
        if (walletToInvestigate == _teamVestingWallet && ((_teamVestingWalletLimitedTime <= block.timestamp && _teamVestingWalletLimitedAmount <= amount) || _teamVestingWalletLimitedAmount <= amount)) {
            return true;
        }
        if (walletToInvestigate == _devWallet && ((_devWalletLimitedTime <= block.timestamp && _devWalletLimitedAmount <= amount) || _devWalletLimitedAmount <= amount)) {
            return true;
        }
        if (walletToInvestigate == _charityWallet && ((_charityWalletLimitedTime <= block.timestamp && _charityWalletLimitedAmount <= amount) || _charityWalletLimitedAmount <= amount)) {
            return true;
        }
        if (walletToInvestigate == _foundationWallet1 && ((_foundationWallet1LimitedTime <= block.timestamp && _foundationWallet1LimitedAmount <= amount) || _foundationWallet1LimitedAmount <= amount)) {
            return true;
        }
        if (walletToInvestigate == _foundationWallet2 && ((_foundationWallet2LimitedTime <= block.timestamp && _foundationWallet2LimitedAmount <= amount) || _foundationWallet2LimitedAmount <= amount)) {
            return true;
        }
        else return false;
    }

    function isWalletLimitedNow(address walletToInvestigate) external view virtual returns(uint256, string memory, uint) {
        if (walletToInvestigate == _teamVestingWallet && _teamVestingWalletLimitedTime >= block.timestamp) {
            return (_teamVestingWalletLimitedAmount, "amount is the limit for seconds of", _teamVestingWalletLimitedTime - block.timestamp);
        }
        if (walletToInvestigate == _devWallet && _devWalletLimitedTime >= block.timestamp) {
            return (_devWalletLimitedAmount, "amount is the limit for seconds of", _devWalletLimitedTime - block.timestamp);
        }
        if (walletToInvestigate == _charityWallet && _teamVestingWalletLimitedTime >= block.timestamp) {
            return (_charityWalletLimitedAmount, "amount is the limit for seconds of", _charityWalletLimitedTime - block.timestamp);
        }
        if (walletToInvestigate == _foundationWallet1 && _foundationWallet1LimitedTime >= block.timestamp) {
            return (_foundationWallet1LimitedAmount, "amount is the limit for seconds of", _foundationWallet1LimitedTime - block.timestamp);
        }
        if (walletToInvestigate == _foundationWallet2 && _foundationWallet2LimitedTime >= block.timestamp) {
            return (_foundationWallet2LimitedAmount, "amount is the limit for seconds of", _foundationWallet2LimitedTime - block.timestamp);
        }
        else return (0,"wallet is not limited", 0);
    }

    
    
    function setTeamVestingWallet (address newWallet) external virtual returns (bool) {
        require(msg.sender == _owner);
        _teamVestingWallet = newWallet;
        return true;
    }
        function setDevWallet (address newWallet) external virtual returns (bool) {
        require(msg.sender == _owner);
        _devWallet = newWallet;
        return true;
    }
        function setCharityWallet (address newWallet) external virtual returns (bool) {
        require(msg.sender == _owner);
        _charityWallet = newWallet;
        return true;
    }
        function setFoundation1Wallet (address newWallet) external virtual returns (bool) {
        require(msg.sender == _owner);
        _foundationWallet1 = newWallet;
        return true;
    }
        function setFoundation2Wallet (address newWallet) external virtual returns (bool) {
        require(msg.sender == _owner);
        _foundationWallet2 = newWallet;
        return true;
    }
        function setLiquidityWallet (address newWallet) external virtual returns (bool) {
        require(msg.sender == _owner);
        _liquidityWallet = newWallet;
        return true;
    }
    

    
    function name() external view virtual override returns (string memory) {
        return _name;
    }

    
    function symbol() external view virtual override returns (string memory) {
        return _symbol;
    }

    
    function decimals() external view virtual override returns (uint8) {
        return 18;
    }

    
    function totalSupply() external view virtual override returns (uint256) {
        return _totalSupply;
    }

    
    function balanceOf(address account) external view virtual override returns (uint256) {
        return _balances[account];
    }

    
    function transfer(address recipient, uint256 amount) external virtual override returns (bool) {
        require (canWalletSpendAmountNow(msg.sender, amount));
        if (msg.sender == _teamVestingWallet && _teamVestingWalletLimitedTime <= block.timestamp && _teamVestingWalletLimitedAmount <= amount) {
            _teamVestingWalletLimitedAmount -= amount;
        }
        if (msg.sender == _devWallet && _devWalletLimitedTime <= block.timestamp && _devWalletLimitedAmount <= amount) {
            _devWalletLimitedAmount -= amount;
        }
        if (msg.sender == _charityWallet && _charityWalletLimitedTime <= block.timestamp && _charityWalletLimitedAmount <= amount) {
            _charityWalletLimitedAmount -= amount;
        }
        if (msg.sender == _foundationWallet1 && _foundationWallet1LimitedTime <= block.timestamp && _foundationWallet1LimitedAmount <= amount) {
            _foundationWallet1LimitedAmount -= amount;
        }
        if (msg.sender == _foundationWallet2 && _foundationWallet2LimitedTime <= block.timestamp && _foundationWallet2LimitedAmount <= amount) {
            _foundationWallet2LimitedAmount -= amount;
        }
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    
    function allowance(address owner, address spender) external view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    
    function approve(address spender, uint256 amount) external virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    
    function transferFrom(address sender, address recipient, uint256 amount) external virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "BEP20: transfer amount exceeds allowance");
        unchecked {
            _approve(sender, _msgSender(), currentAllowance - amount);
        }

        return true;
    }

    
    function increaseAllowance(address spender, uint256 addedValue) external virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    
    function decreaseAllowance(address spender, uint256 subtractedValue) external virtual returns (bool) {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "BEP20: decreased allowance below zero");
        unchecked {
            _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    
    function _transfer( address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "BEP20: transfer from the zero address");
        require(recipient != address(0), "BEP20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "BEP20: transfer amount exceeds balance");
        unchecked {
            _balances[sender] = senderBalance - amount;
        }
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);

        _afterTokenTransfer(sender, recipient, amount);
    }

    
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "BEP20: approve from the zero address");
        require(spender != address(0), "BEP20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {}

    
    function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual {}
}
