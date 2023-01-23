pragma solidity ^0.8.0;


 
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/security/ReentrancyGuard.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Context.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol';    
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';
import 'https://github.com/Uniswap/v2-core/blob/master/contracts/interfaces/IUniswapV2Factory.sol';
import 'https://github.com/Uniswap/v2-core/blob/master/contracts/interfaces/IUniswapV2Pair.sol';
import 'https://github.com/Uniswap/v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router01.sol';    
import 'https://github.com/Uniswap/v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol';   


contract NAME is Context, IERC20, Ownable, ReentrancyGuard {
    using SafeMath for uint256;
    using Address for address;

    mapping (address => uint256) private _rOwned;
    mapping (address => uint256) private _tOwned;
    mapping (address => mapping (address => uint256)) private _allowances;

    mapping (address => bool) private _isExcludedFromFee;
    mapping (address => bool) private _isExcludedFromReward;
    address[] private _excludedFromReward;

    address BURN_ADDRESS = 0x0000000000000000000000000000000000000001;
    address DEV_ADDRESS = 0x95378E3f225C8f0bcD5c31083B26d83f0E8C62F4;
    
    uint256 private constant MAX = ~uint256(0);
    uint256 private _tTotal = 1000000000 * 10**2 * 10**9;
    uint256 private _rTotal = (MAX - (MAX % _tTotal));
    uint256 private _tHODLrRewardsTotal;

    string private _name = "NAME";
    string private _symbol = "NAME";
    uint8 private _decimals = 9;
    
    uint256 public _rewardFee = 5;
    uint256 private _previousRewardFee = _rewardFee;
    
    uint256 public _burnFee = 2;
    uint256 private _previousBurnFee = _burnFee;

    
    uint256 public _devFee = 1;
    uint256 private _previousDevFee = _devFee;

    IUniswapV2Router02 public  uniswapV2Router;
    address public  uniswapV2Pair;
    uint256 public _maxTxAmount = 10000000000 * 10**9;

    event TransferBurn(address indexed from, address indexed burnAddress, uint256 value);
    event TransferDev(address indexed from, address indexed devAddress, uint256 value);

    constructor () {
        _rOwned[_msgSender()] = _rTotal;
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0xD99D1c33F9fC3444f8101754aBC46c52416550D1);       
        
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).createPair(address(this), _uniswapV2Router.WETH());
        
        uniswapV2Router = _uniswapV2Router;

        
        _isExcludedFromFee[owner()] = true;
        
        _isExcludedFromFee[address(this)] = true;
        _isExcludedFromReward[address(this)] = true;
        _isExcludedFromFee[BURN_ADDRESS] = true;
        _isExcludedFromReward[BURN_ADDRESS] = true;
        _isExcludedFromFee[DEV_ADDRESS] = true;
        _isExcludedFromReward[DEV_ADDRESS] =  true;

        emit Transfer(address(0), _msgSender(), _tTotal);
    }

    function name() public view returns (string memory) {return _name;}
    function symbol() public view returns (string memory) {return _symbol;}
    function decimals() public view returns (uint8) {return _decimals;}
    function totalSupply() public view override returns (uint256) {return _tTotal;}

    function balanceOf(address account) public view override returns (uint256) {
        if (_isExcludedFromReward[account]) return _tOwned[account];
        return tokenFromReflection(_rOwned[account]);
    }

    function withdraw() external onlyOwner nonReentrant{
        uint256 balance = IERC20(address(this)).balanceOf(address(this));
        IERC20(address(this)).transfer(msg.sender, balance);
        payable(msg.sender).transfer(address(this).balance);
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
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function totalHODLrRewards() public view returns (uint256) {
        return _tHODLrRewardsTotal;
    }

        function totalBurned() public view returns (uint256) {
        return balanceOf(BURN_ADDRESS);
    }
    
    
    function totalSentToDev() public view returns (uint256){
        return balanceOf(DEV_ADDRESS);
    }

    function deliver(uint256 tAmount) public {
        address sender = _msgSender();
        require(!_isExcludedFromReward[sender], "Excluded addresses cannot call this function");
        (uint256 rAmount,,,,,,) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rTotal = _rTotal.sub(rAmount);
        _tHODLrRewardsTotal = _tHODLrRewardsTotal.add(tAmount);
    }

    function reflectionFromToken(uint256 tAmount, bool deductTransferFee) public view returns(uint256) {
        require(tAmount <= _tTotal, "Amount must be less than supply");
        if (!deductTransferFee) {
            (uint256 rAmount,,,,,,) = _getValues(tAmount);
            return rAmount;
        } else {
            (,uint256 rTransferAmount,,,,,) = _getValues(tAmount);
            return rTransferAmount;
        }
    }

    function tokenFromReflection(uint256 rAmount) public view returns(uint256) {
        require(rAmount <= _rTotal, "Amount must be less than total reflections");
        uint256 currentRate =  _getRate();
        return rAmount.div(currentRate);
    }

    function isExcludedFromReward(address account) public view returns (bool) {
        return _isExcludedFromReward[account];
    }

    function excludeFromReward(address account) public onlyOwner {
        require(!_isExcludedFromReward[account], "Account is already excluded");
        if(_rOwned[account] > 0) {
            _tOwned[account] = tokenFromReflection(_rOwned[account]);
        }
        _isExcludedFromReward[account] = true;
        _excludedFromReward.push(account);
    }

    function includeInReward(address account) external onlyOwner {
        require(_isExcludedFromReward[account], "Account is already excluded");
        for (uint256 i = 0; i < _excludedFromReward.length; i++) {
            if (_excludedFromReward[i] == account) {
                _excludedFromReward[i] = _excludedFromReward[_excludedFromReward.length - 1];
                _tOwned[account] = 0;
                _isExcludedFromReward[account] = false;
                _excludedFromReward.pop();
                break;
            }
        }
    }

    function excludeFromFee(address account) public onlyOwner {
        _isExcludedFromFee[account] = true;
    }
    
    function includeInFee(address account) public onlyOwner {
        _isExcludedFromFee[account] = false;
    }
    
    function setRewardFeePercent(uint256 rewardFee) external onlyOwner {
        _rewardFee = rewardFee;
    }
    
    function setBurnFeePercent(uint256 burnFee) external onlyOwner {
        _burnFee = burnFee;
    }

    function setDevFeePercent(uint256 devFee) external onlyOwner{
        _devFee = devFee;
    }
    
    function setMaxTxPercent(uint256 maxTxPercent) external onlyOwner {
        _maxTxAmount = _tTotal.mul(maxTxPercent).div(
            10**2
        );
    }

    receive() external payable {}

    function _HODLrFee(uint256 rHODLrFee, uint256 tHODLrFee) private {
        _rTotal = _rTotal.sub(rHODLrFee);
        _tHODLrRewardsTotal = _tHODLrRewardsTotal.add(tHODLrFee);
    }

    function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256) {
        (uint256 tTransferAmount, uint256 tHODLrFee, uint256 tBurn, uint256 tDev) = _getTValues(tAmount);
        (uint256 rAmount, uint256 rTransferAmount, uint256 rHODLrFee) = _getRValues(tAmount, tHODLrFee, tBurn, tDev, _getRate());
        return (rAmount, rTransferAmount, rHODLrFee, tTransferAmount, tHODLrFee, tBurn,tDev);
    }

    function _getTValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256) {
        uint256 tHODLrFee = calculateRewardFee(tAmount);
        uint256 tBurn = calculateBurnFee(tAmount);
        uint256 tDev = calculateDevFee(tAmount);
        uint256 tTransferAmount = tAmount.sub(tHODLrFee).sub(tBurn).sub(tDev);
        return (tTransferAmount, tHODLrFee, tBurn, tDev);
    }

    function _getRValues(uint256 tAmount, uint256 tHODLrFee, uint256 tBurn, uint tDev, uint256 currentRate) private pure returns (uint256, uint256, uint256) {
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rHODLrFee = tHODLrFee.mul(currentRate);
        uint256 rBurn = tBurn.mul(currentRate);
        uint256 rDev = tDev.mul(currentRate);
        uint256 rTransferAmount = rAmount.sub(rHODLrFee).sub(rBurn).sub(rDev);
        return (rAmount, rTransferAmount, rHODLrFee);
    }

    function _getRate() private view returns(uint256) {
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        return rSupply.div(tSupply);
    }

    function _getCurrentSupply() private view returns(uint256, uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;
        for (uint256 i = 0; i < _excludedFromReward.length; i++) {
            if (_rOwned[_excludedFromReward[i]] > rSupply || _tOwned[_excludedFromReward[i]] > tSupply) return (_rTotal, _tTotal);
            rSupply = rSupply.sub(_rOwned[_excludedFromReward[i]]);
            tSupply = tSupply.sub(_tOwned[_excludedFromReward[i]]);
        }
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }
    

    
    function calculateRewardFee(uint256 _amount) private view returns (uint256) {
        return _amount.mul(_rewardFee).div(
            10**2
        );
    }

    function calculateBurnFee(uint256 _amount) private view returns (uint256) {
        return _amount.mul(_burnFee).div(
            10**2
        );
    }

    function calculateDevFee(uint256 _amount) private view returns (uint256){
        return _amount.mul(_devFee).div(
            10**2
        );
    }
    
    function removeAllFee() private {
        if(_rewardFee == 0 && _burnFee == 0) return;        
        _previousRewardFee = _rewardFee;
        _previousBurnFee = _burnFee;
        _previousDevFee = _devFee;      
        _rewardFee = 0;
        _burnFee = 0;
        _devFee = 0;
    }
    
    function restoreAllFee() private {
        _rewardFee = _previousRewardFee;
        _burnFee = _previousBurnFee;
        _devFee = _previousDevFee;
    }
    
    function isExcludedFromFee(address account) public view returns(bool) {
        return _isExcludedFromFee[account];
    }

     function _setDevWallet(address _DEV_ADDRESS) external onlyOwner {
        DEV_ADDRESS = _DEV_ADDRESS;
    }

    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");
        if(from != owner() && to != owner())
            require(amount <= _maxTxAmount, "Transfer amount exceeds the maxTxAmount.");
        bool takeFee = true;
        if(_isExcludedFromFee[from] || _isExcludedFromFee[to]){
            takeFee = false;
        }
        _tokenTransfer(from,to,amount,takeFee);
    }
    function _tokenTransfer(address sender, address recipient, uint256 amount,bool takeFee) private {
        if(!takeFee)
            removeAllFee();     
        if (_isExcludedFromReward[sender] && !_isExcludedFromReward[recipient]) {
            _transferFromExcluded(sender, recipient, amount);
        } else if (!_isExcludedFromReward[sender] && _isExcludedFromReward[recipient]) {
            _transferToExcluded(sender, recipient, amount);
        } else if (!_isExcludedFromReward[sender] && !_isExcludedFromReward[recipient]) {
            _transferStandard(sender, recipient, amount);
        } else if (_isExcludedFromReward[sender] && _isExcludedFromReward[recipient]) {
            _transferBothExcluded(sender, recipient, amount);
        } else {
            _transferStandard(sender, recipient, amount);
        }       
        if(!takeFee)
            restoreAllFee();
    }

    function _transferBurn(uint256 tBurn) private {
        uint256 currentRate = _getRate();
        uint256 rBurn = tBurn.mul(currentRate);     
        _rOwned[BURN_ADDRESS] = _rOwned[BURN_ADDRESS].add(rBurn);
        if(_isExcludedFromReward[BURN_ADDRESS])
            _tOwned[BURN_ADDRESS] = _tOwned[BURN_ADDRESS].add(tBurn);
    }

    function _transferDev(uint256 tDev) private {
        uint256 currentRate = _getRate();
        uint256 rDev = tDev.mul(currentRate);       
        _rOwned[DEV_ADDRESS] = _rOwned[DEV_ADDRESS].add(rDev);
        if(_isExcludedFromReward[DEV_ADDRESS])
            _tOwned[DEV_ADDRESS] = _tOwned[DEV_ADDRESS].add(tDev);
    }

    function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rHODLrFee,
            uint256 tTransferAmount,
            uint256 tHODLrFee,
            uint256 tBurn,
            uint256 tDev
        ) = _getValues(tAmount);
        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _transferBurn(tBurn);
        _transferDev(tDev);
        _HODLrFee(rHODLrFee, tHODLrFee);
        emit TransferBurn(sender, BURN_ADDRESS, tBurn);
        emit TransferDev(sender, DEV_ADDRESS, tDev);
        emit Transfer(sender, recipient, tTransferAmount);
    }
    
    function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {
        (
            uint256 rAmount, 
            uint256 rTransferAmount, 
            uint256 rHODLrFee, 
            uint256 tTransferAmount, 
            uint256 tHODLrFee, 
            uint256 tBurn,
            uint256 tDev) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _transferBurn(tBurn);
        _transferDev(tDev);
        _HODLrFee(rHODLrFee, tHODLrFee);        
        emit TransferBurn(sender, BURN_ADDRESS, tBurn);
        emit TransferDev(sender, DEV_ADDRESS, tDev);
        emit Transfer(sender, recipient, tTransferAmount);
    }
    
    function _transferStandard(address sender, address recipient, uint256 tAmount) private {
        (uint256 rAmount, uint256 rTransferAmount, uint256 rHODLrFee, uint256 tTransferAmount, uint256 tHODLrFee, uint256 tBurn, uint256 tDev) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _transferBurn(tBurn);
        _transferDev(tDev);
        _HODLrFee(rHODLrFee, tHODLrFee);
        emit TransferBurn(sender, BURN_ADDRESS, tBurn);
        emit TransferDev(sender, DEV_ADDRESS, tDev);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {
        (uint256 rAmount, uint256 rTransferAmount, uint256 rHODLrFee, uint256 tTransferAmount, uint256 tHODLrFee, uint256 tBurn, uint tDev) = _getValues(tAmount);
        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _transferBurn(tBurn);
        _transferDev(tDev);
        _HODLrFee(rHODLrFee, tHODLrFee);
        emit TransferBurn(sender, BURN_ADDRESS, tBurn);
        emit TransferDev(sender, DEV_ADDRESS, tDev);
        emit Transfer(sender, recipient, tTransferAmount);
    }


    
    
    function setRouterAddress(address newRouter) public onlyOwner{
        IUniswapV2Router02 _newPancakeRouter = IUniswapV2Router02(newRouter);
        uniswapV2Pair = IUniswapV2Factory(_newPancakeRouter.factory()).createPair(address(this), _newPancakeRouter.WETH());
        uniswapV2Router = _newPancakeRouter;
    }
    

}
