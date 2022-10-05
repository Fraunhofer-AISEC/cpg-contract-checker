pragma solidity ^0.8.0;


contract FrankInuToken is Context, IERC20, Ownable {
    using SafeMath for uint256;
    using Address for address;

    address payable public marketingAddress =
        payable(0xBc1edb05DbD63b86562385C15385342Bf197d553);
    address payable public devAddress =
        payable(0xc614FA09453Ba08c61a2Bda9C51d58B17f8cF5Db);
    address payable public liquidityAddress =
        payable(0x2A3205E74b9703724c4d1334C2C786A855565726);
    address payable public treasuryAddress =
        payable(0xb279Cc7949ab30D04E61d746e355ab83d848F13B);

    address private _owner;

    mapping(address => uint256) private _rOwned;
    mapping(address => uint256) private _tOwned;
    mapping(address => mapping(address => uint256)) private _allowances;

    bool public limitsInEffect = true;
    mapping(address => bool) public blacklist;

    mapping(address => bool) private _isExcludedFromFee;

    mapping(address => bool) private _isExcluded;
    address[] private _excluded;

    uint256 private constant MAX = ~uint256(0);
    uint256 private constant _tTotal = 100_000_000_000 * 1e9;
    uint256 private _rTotal = (MAX - (MAX % _tTotal));
    uint256 private _tFeeTotal;

    string private constant _name = "Frank Inu";
    string private constant _symbol = "FRANK";
    uint8 private constant _decimals = 9;

    uint256 private _taxFee;
    uint256 private _previousTaxFee = _taxFee;

    uint256 private _teamFee;

    uint256 private _liquidityFee;
    uint256 private _previousLiquidityFee = _liquidityFee;

    uint256 private constant BUY = 1;
    uint256 private constant SELL = 2;
    uint256 private constant TRANSFER = 3;
    uint256 private buyOrSellSwitch;


    uint256 public _buyTaxFee = 1;
    uint256 public _buyLiquidityFee = 2;
    uint256 public _buyTeamFee = 9;

    uint256 public _sellTaxFee = 1;
    uint256 public _sellLiquidityFee = 2;
    uint256 public _sellTeamFee = 9;

    uint256 public _percentTeamFundsToDev = 333;
    uint256 public _percentTeamFundsToTreasury = 333;

    uint256 public tradingActiveBlock = 0; 

    uint256 public _liquidityTokensToSwap;
    uint256 public _teamTokensToSwap;

    uint256 public maxTransactionAmount;
    uint256 public maxWalletAmount;
    mapping(address => bool) public _isExcludedMaxTransactionAmount;

    mapping(address => bool) public automatedMarketMakerPairs;

    uint256 private minimumTokensBeforeSwap;

    IUniswapV2Router public uniswapV2Router;
    address public uniswapV2Pair;

    bool private inSwapAndLiquify;
    bool public swapAndLiquifyEnabled = false;
    bool public tradingActive = false;

    event SwapAndLiquifyEnabledUpdated(bool enabled);
    event SwapAndLiquify(
        uint256 tokensSwapped,
        uint256 ethReceived,
        uint256 tokensIntoLiquidity
    );

    event SwapETHForTokens(uint256 amountIn, address[] path);

    event SwapTokensForETH(uint256 amountIn, address[] path);

    event SetAutomatedMarketMakerPair(address pair, bool value);

    event ExcludeFromReward(address excludedAddress);

    event IncludeInReward(address includedAddress);

    event ExcludeFromFee(address excludedAddress);

    event IncludeInFee(address includedAddress);

    event SetBuyFee(uint256 teamFee, uint256 liquidityFee, uint256 reflectFee);

    event SetSellFee(uint256 teamFee, uint256 liquidityFee, uint256 reflectFee);

    event TransferForeignToken(address token, uint256 amount);

    event UpdatedTeamAddress(address team);

    event UpdatedLiquidityAddress(address liquidity);

    event OwnerForcedSwapBack(uint256 timestamp);

    event BoughtEarly(address indexed sniper);

    event RemovedSniper(address indexed notsnipersupposedly);

    modifier lockTheSwap() {
        inSwapAndLiquify = true;
        _;
        inSwapAndLiquify = false;
    }

    constructor() payable {
        _owner = msg.sender;
        _rOwned[_owner] = (_rTotal / 1000) * 350;
        _rOwned[address(this)] = (_rTotal / 1000) * 650;

        maxTransactionAmount = (_tTotal * 3) / 1000; 
        maxWalletAmount = (_tTotal * 5) / 1000; 
        minimumTokensBeforeSwap = (_tTotal * 5) / 10000; 

        _isExcludedFromFee[owner()] = true;
        _isExcludedFromFee[address(this)] = true;
        _isExcludedFromFee[marketingAddress] = true;
        _isExcludedFromFee[liquidityAddress] = true;
        _isExcludedFromFee[treasuryAddress] = true;
        _isExcludedFromFee[devAddress] = true;

        excludeFromMaxTransaction(owner(), true);
        excludeFromMaxTransaction(address(this), true);
        excludeFromMaxTransaction(address(0xdead), true);
        excludeFromMaxTransaction(marketingAddress, true);
        excludeFromMaxTransaction(liquidityAddress, true);
        excludeFromMaxTransaction(devAddress, true);
        excludeFromMaxTransaction(treasuryAddress, true);

        emit Transfer(address(0), _owner, (_tTotal * 350) / 1000);
        emit Transfer(address(0), address(this), (_tTotal * 650) / 1000);
    }

    function name() external pure returns (string memory) {
        return _name;
    }

    function symbol() external pure returns (string memory) {
        return _symbol;
    }

    function decimals() external pure returns (uint8) {
        return _decimals;
    }

    function totalSupply() external pure override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
        if (_isExcluded[account]) return _tOwned[account];
        return tokenFromReflection(_rOwned[account]);
    }

    function transfer(address recipient, uint256 amount)
        external
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender)
        external
        view
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()].sub(
                amount,
                "ERC20: transfer amount exceeds allowance"
            )
        );
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue)
        external
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].add(addedValue)
        );
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        external
        virtual
        returns (bool)
    {
        _approve(
            _msgSender(),
            spender,
            _allowances[_msgSender()][spender].sub(
                subtractedValue,
                "ERC20: decreased allowance below zero"
            )
        );
        return true;
    }

    function isExcludedFromReward(address account)
        external
        view
        returns (bool)
    {
        return _isExcluded[account];
    }

    function totalFees() external view returns (uint256) {
        return _tFeeTotal;
    }

    
    function removeLimits() external onlyOwner returns (bool) {
        limitsInEffect = false;
        return true;
    }

    function excludeFromMaxTransaction(address updAds, bool isEx)
        public
        onlyOwner
    {
        _isExcludedMaxTransactionAmount[updAds] = isEx;
    }

    
    function enableTrading() internal onlyOwner {
        tradingActive = true;
        swapAndLiquifyEnabled = true;
        tradingActiveBlock = block.number;
    }

    function launch() external onlyOwner returns (bool) {
        require(!tradingActive, "Trading is already active, cannot relaunch.");

        enableTrading();
        IUniswapV2Router _uniswapV2Router = IUniswapV2Router(
            0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
        );
        excludeFromMaxTransaction(address(_uniswapV2Router), true);
        uniswapV2Router = _uniswapV2Router;
        _approve(address(this), address(uniswapV2Router), _tTotal);
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());
        excludeFromMaxTransaction(address(uniswapV2Pair), true);
        _setAutomatedMarketMakerPair(address(uniswapV2Pair), true);
        require(
            address(this).balance > 0,
            "Must have ETH on contract to launch"
        );
        addLiquidity(balanceOf(address(this)), address(this).balance);
        transferOwnership(_owner);
        return true;
    }

    function minimumTokensBeforeSwapAmount() external view returns (uint256) {
        return minimumTokensBeforeSwap;
    }

    function setAutomatedMarketMakerPair(address pair, bool value)
        public
        onlyOwner
    {
        require(
            pair != uniswapV2Pair,
            "The pair cannot be removed from automatedMarketMakerPairs"
        );

        _setAutomatedMarketMakerPair(pair, value);
    }

    function _setAutomatedMarketMakerPair(address pair, bool value) private {
        automatedMarketMakerPairs[pair] = value;
        _isExcludedMaxTransactionAmount[pair] = value;
        if (value) {
            excludeFromReward(pair);
        }
        if (!value) {
            includeInReward(pair);
        }
    }

    function reflectionFromToken(uint256 tAmount, bool deductTransferFee)
        external
        view
        returns (uint256)
    {
        require(tAmount <= _tTotal, "Amount must be less than supply");
        if (!deductTransferFee) {
            (uint256 rAmount, , , , , ) = _getValues(tAmount);
            return rAmount;
        } else {
            (, uint256 rTransferAmount, , , , ) = _getValues(tAmount);
            return rTransferAmount;
        }
    }

    function tokenFromReflection(uint256 rAmount)
        public
        view
        returns (uint256)
    {
        require(
            rAmount <= _rTotal,
            "Amount must be less than total reflections"
        );
        uint256 currentRate = _getRate();
        return rAmount.div(currentRate);
    }

    function excludeFromReward(address account) public onlyOwner {
        require(!_isExcluded[account], "Account is already excluded");
        require(
            _excluded.length + 1 <= 50,
            "Cannot exclude more than 50 accounts.  Include a previously excluded address."
        );
        if (_rOwned[account] > 0) {
            _tOwned[account] = tokenFromReflection(_rOwned[account]);
        }
        _isExcluded[account] = true;
        _excluded.push(account);
    }

    function includeInReward(address account) public onlyOwner {
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

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) private {
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
        require(!blacklist[from], "From address blacklist. Contact admin");
        require(!blacklist[to], "To address blacklist. Contact admin");

        if (!tradingActive) {
            require(
                _isExcludedFromFee[from] || _isExcludedFromFee[to],
                "Trading is not active yet."
            );
        }

        if (limitsInEffect) {
            if (
                from != owner() &&
                to != owner() &&
                to != address(0) &&
                to != address(0xdead) &&
                !inSwapAndLiquify
            ) {
                
                if (
                    automatedMarketMakerPairs[from] &&
                    !_isExcludedMaxTransactionAmount[to]
                ) {
                    require(
                        amount <= maxTransactionAmount,
                        "Buy transfer amount exceeds the maxTransactionAmount."
                    );
                }
                
                else if (
                    automatedMarketMakerPairs[to] &&
                    !_isExcludedMaxTransactionAmount[from]
                ) {
                    require(
                        amount <= maxTransactionAmount,
                        "Sell transfer amount exceeds the maxTransactionAmount."
                    );
                }

                if (!_isExcludedMaxTransactionAmount[to]) {
                    require(
                        balanceOf(to) + amount <= maxWalletAmount,
                        "Max wallet exceeded"
                    );
                }
            }
        }

        uint256 totalTokensToSwap = _liquidityTokensToSwap.add(
            _teamTokensToSwap
        );
        uint256 contractTokenBalance = balanceOf(address(this));
        bool overMinimumTokenBalance = contractTokenBalance >=
            minimumTokensBeforeSwap;

        
        if (
            !inSwapAndLiquify &&
            swapAndLiquifyEnabled &&
            balanceOf(uniswapV2Pair) > 0 &&
            totalTokensToSwap > 0 &&
            !_isExcludedFromFee[to] &&
            !_isExcludedFromFee[from] &&
            automatedMarketMakerPairs[to] &&
            overMinimumTokenBalance
        ) {
            swapBack();
        }

        bool takeFee = true;

        
        if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {
            takeFee = false;
            buyOrSellSwitch = TRANSFER; 
        } else {
            
            if (automatedMarketMakerPairs[from]) {
                removeAllFee();
                buyOrSellSwitch = BUY;
                if (block.number == tradingActiveBlock) {
                    _taxFee = 0;
                    _liquidityFee = 90;
                } else if (block.number == tradingActiveBlock + 1) {
                    _taxFee = 0;
                    _liquidityFee = 50;
                } else {
                    _taxFee = _buyTaxFee;
                    _liquidityFee = _buyLiquidityFee + _buyTeamFee;
                }
            }
            
            else if (automatedMarketMakerPairs[to]) {
                removeAllFee();
                buyOrSellSwitch = SELL;
                
                if (block.number == tradingActiveBlock) {
                    _taxFee = 0;
                    _liquidityFee = 90;
                } else if (block.number == tradingActiveBlock + 1) {
                    _taxFee = 0;
                    _liquidityFee = 50;
                } else {
                    _taxFee = _sellTaxFee;
                    _liquidityFee = _sellLiquidityFee + _sellTeamFee;
                }
                
            } else {
                removeAllFee();
                buyOrSellSwitch = TRANSFER; 
            }
        }

        _tokenTransfer(from, to, amount, takeFee);
    }

    function swapBack() private lockTheSwap {
        uint256 contractBalance = balanceOf(address(this));
        uint256 totalTokensToSwap = _liquidityTokensToSwap + _teamTokensToSwap;

        
        uint256 tokensForLiquidity = _liquidityTokensToSwap.div(2);
        uint256 amountToSwapForETH = contractBalance.sub(tokensForLiquidity);

        uint256 initialETHBalance = address(this).balance;

        swapTokensForETH(amountToSwapForETH);

        uint256 ethBalance = address(this).balance.sub(initialETHBalance);

        uint256 ethForMarketing = ethBalance.mul(_teamTokensToSwap).div(
            totalTokensToSwap
        );

        uint256 ethForLiquidity = ethBalance.sub(ethForMarketing);

        uint256 ethForDev = ethForMarketing.mul(_percentTeamFundsToDev).div(
            1000
        );
        uint256 ethForTreasury = ethForMarketing
            .mul(_percentTeamFundsToTreasury)
            .div(1000);
        ethForMarketing -= ethForDev;
        ethForMarketing -= ethForTreasury;

        _liquidityTokensToSwap = 0;
        _teamTokensToSwap = 0;

        (bool success, ) = address(marketingAddress).call{
            value: ethForMarketing
        }("");
        (success, ) = address(devAddress).call{ value: ethForDev }("");
        (success, ) = address(treasuryAddress).call{ value: ethForTreasury }(
            ""
        );

        addLiquidity(tokensForLiquidity, ethForLiquidity);
        emit SwapAndLiquify(
            amountToSwapForETH,
            ethForLiquidity,
            tokensForLiquidity
        );

        
        if (address(this).balance > 1e17) {
            (success, ) = address(marketingAddress).call{
                value: address(this).balance
            }("");
        }
    }

    function swapTokensForETH(uint256 tokenAmount) private {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, 
            path,
            address(this),
            block.timestamp
        );
    }

    
    function _tokenTransfer(
        address sender,
        address recipient,
        uint256 amount,
        bool takeFee
    ) private {
        if (!takeFee) removeAllFee();

        if (_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferFromExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && _isExcluded[recipient]) {
            _transferToExcluded(sender, recipient, amount);
        } else if (_isExcluded[sender] && _isExcluded[recipient]) {
            _transferBothExcluded(sender, recipient, amount);
        } else {
            _transferStandard(sender, recipient, amount);
        }

        if (!takeFee) restoreAllFee();
    }

    function _transferStandard(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tLiquidity
        ) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeLiquidity(tLiquidity);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferToExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tLiquidity
        ) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeLiquidity(tLiquidity);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferFromExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tLiquidity
        ) = _getValues(tAmount);
        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeLiquidity(tLiquidity);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferBothExcluded(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tLiquidity
        ) = _getValues(tAmount);
        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeLiquidity(tLiquidity);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _reflectFee(uint256 rFee, uint256 tFee) private {
        _rTotal = _rTotal.sub(rFee);
        _tFeeTotal = _tFeeTotal.add(tFee);
    }

    function _getValues(uint256 tAmount)
        private
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        (
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tLiquidity
        ) = _getTValues(tAmount);
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(
            tAmount,
            tFee,
            tLiquidity,
            _getRate()
        );
        return (
            rAmount,
            rTransferAmount,
            rFee,
            tTransferAmount,
            tFee,
            tLiquidity
        );
    }

    function _getTValues(uint256 tAmount)
        private
        view
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 tFee = calculateTaxFee(tAmount);
        uint256 tLiquidity = calculateLiquidityFee(tAmount);
        uint256 tTransferAmount = tAmount.sub(tFee).sub(tLiquidity);
        return (tTransferAmount, tFee, tLiquidity);
    }

    function _getRValues(
        uint256 tAmount,
        uint256 tFee,
        uint256 tLiquidity,
        uint256 currentRate
    )
        private
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rFee = tFee.mul(currentRate);
        uint256 rLiquidity = tLiquidity.mul(currentRate);
        uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity);
        return (rAmount, rTransferAmount, rFee);
    }

    function _getRate() private view returns (uint256) {
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        return rSupply.div(tSupply);
    }

    function _getCurrentSupply() private view returns (uint256, uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (
                _rOwned[_excluded[i]] > rSupply ||
                _tOwned[_excluded[i]] > tSupply
            ) return (_rTotal, _tTotal);
            rSupply = rSupply.sub(_rOwned[_excluded[i]]);
            tSupply = tSupply.sub(_tOwned[_excluded[i]]);
        }
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }

    function _takeLiquidity(uint256 tLiquidity) private {
        if (buyOrSellSwitch == BUY) {
            _liquidityTokensToSwap +=
                (tLiquidity * _buyLiquidityFee) /
                _liquidityFee;
            _teamTokensToSwap += (tLiquidity * _buyTeamFee) / _liquidityFee;
        } else if (buyOrSellSwitch == SELL) {
            _liquidityTokensToSwap +=
                (tLiquidity * _sellLiquidityFee) /
                _liquidityFee;
            _teamTokensToSwap += (tLiquidity * _sellTeamFee) / _liquidityFee;
        }
        uint256 currentRate = _getRate();
        uint256 rLiquidity = tLiquidity.mul(currentRate);
        _rOwned[address(this)] = _rOwned[address(this)].add(rLiquidity);
        if (_isExcluded[address(this)])
            _tOwned[address(this)] = _tOwned[address(this)].add(tLiquidity);
    }

    function calculateTaxFee(uint256 _amount) private view returns (uint256) {
        return _amount.mul(_taxFee).div(10**2);
    }

    function calculateLiquidityFee(uint256 _amount)
        private
        view
        returns (uint256)
    {
        return _amount.mul(_liquidityFee).div(10**2);
    }

    function removeAllFee() private {
        if (_taxFee == 0 && _liquidityFee == 0) return;

        _previousTaxFee = _taxFee;
        _previousLiquidityFee = _liquidityFee;

        _taxFee = 0;
        _liquidityFee = 0;
    }

    function restoreAllFee() private {
        _taxFee = _previousTaxFee;
        _liquidityFee = _previousLiquidityFee;
    }


    function setBuyFee(
        uint256 buyTaxFee,
        uint256 buyLiquidityFee,
        uint256 buyTeamFee
    ) external onlyOwner {
        _buyTaxFee = buyTaxFee;
        _buyLiquidityFee = buyLiquidityFee;
        _buyTeamFee = buyTeamFee;
        require(
            _buyTaxFee + _buyLiquidityFee + _buyTeamFee <= 100,
            "Must keep buy taxes below 100%"
        );
        emit SetBuyFee(buyTeamFee, buyLiquidityFee, buyTaxFee);
    }

    function setSellFee(
        uint256 sellTaxFee,
        uint256 sellLiquidityFee,
        uint256 sellTeamFee
    ) external onlyOwner {
        _sellTaxFee = sellTaxFee;
        _sellLiquidityFee = sellLiquidityFee;
        _sellTeamFee = sellTeamFee;
        require(
            _sellTaxFee + _sellLiquidityFee + _sellTeamFee <= 100,
            "Must keep sell taxes below 100%"
        );
        emit SetSellFee(sellTeamFee, sellLiquidityFee, sellTaxFee);
    }

    function setTeamSplit(uint256 treasurySplit, uint256 devSplit)
        external
        onlyOwner
    {
        require(treasurySplit + devSplit < 1000, "Split over 100%");
        _percentTeamFundsToTreasury = treasurySplit;
        _percentTeamFundsToDev = devSplit;
    }

    function setSwapAndLiquifyEnabled(bool _enabled) public onlyOwner {
        swapAndLiquifyEnabled = _enabled;
        emit SwapAndLiquifyEnabledUpdated(_enabled);
    }

    
    receive() external payable {}

    function transferForeignToken(address _token, address _to)
        external
        onlyOwner
        returns (bool _sent)
    {
        require(_token != address(0), "_token address cannot be 0");
        require(_token != address(this), "Can't withdraw native tokens");
        uint256 _contractBalance = IERC20(_token).balanceOf(address(this));
        _sent = IERC20(_token).transfer(_to, _contractBalance);
        emit TransferForeignToken(_token, _contractBalance);
    }
}
