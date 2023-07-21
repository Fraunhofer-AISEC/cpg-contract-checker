

pragma solidity >=0.7.0;

import "./safemath.sol";
import"./Dividend.sol";
import"./IERC20.sol";

contract PrintFriends1 is IERC20, Auth {
    using SafeMath for uint256;

    address private WETH;
    address private DEAD = 0x000000000000000000000000000000000000dEaD;
    address private ZERO = 0x0000000000000000000000000000000000000000;

    address public immutable PEPE = address(0x6982508145454Ce325dDbE47a25d4ec3d2311933); 
    address public immutable FLOKI = address(0xcf0C122c6b73ff809C693DB761e7BaeBe62b6a2E); 

    string public constant  _name = "PrintFriends1";
    string public constant _symbol = "PF1";
    uint8 public constant _decimals = 18;

    uint256 public _totalSupply = 4444444 * (10 ** _decimals);
    uint256 public _maxTxAmountBuy = 100000 * (10 ** _decimals);
    

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    mapping (address => uint256) private cooldown;

    mapping (address => bool) private isFeeExempt;
    mapping (address => bool) private isDividendExempt;
    mapping (address => bool) private isBot;

    uint256 private totalFee = 14;
    uint256 private feeDenominator = 100;


    uint256 private liquidityPercentage = 1;
    uint256 private marketingPercentage = 1;
    uint256 private rewardPercentage = 4; 
    uint256 private buybackandburnsPercentage = 4;
 
    uint256 private _marketingAllocation = 44444;  
    uint256 private _teamAllocation = 44444;  

    address private _uniswapContract;
    address private _giveawayWallet;
    
    
    address payable public marketingWallet = payable(0xE32D8dc8057F238B15DE67866254F1f7f3dc30BB);
    address payable public teamWallet = payable(0x2D174793b82Dc8B28Ba5d5317690B23A172C229A);

    IDEXRouter public router;
    address public pair;

    uint256 public launchedAt;
    bool private tradingOpen;
    bool private buyLimit = true;
    uint256 private maxBuy = _maxTxAmountBuy ;
    uint256 public numTokensSellToAddToLiquidity = (_totalSupply * 1) / 100; 

    PrintFriends1DividendDistributor private distributor;    
    
    bool public blacklistEnabled = false;
    bool private inSwap;
    modifier swapping() { inSwap = true; _; inSwap = false; }

    constructor (
        address _owner        
    ) Auth(_owner) {

        _uniswapContract = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D; 
        
        router = IDEXRouter(_uniswapContract);
            
        WETH = router.WETH();
        
        pair = IDEXFactory(router.factory()).createPair(WETH, address(this));
        
        _allowances[address(this)][address(router)] = type(uint256).max;

        distributor = new PrintFriends1DividendDistributor(_owner);

        isFeeExempt[_owner] = true;
        isFeeExempt[marketingWallet] = true;             
              
        isDividendExempt[pair] = true;
        isDividendExempt[address(this)] = true;
        isDividendExempt[DEAD] = true;        

        _balances[_owner] = _totalSupply;
    
        emit Transfer(address(0), _owner, _totalSupply);

      
    }

    receive() external payable { }

   function totalSupply() external view override returns (uint256) { return _totalSupply; }
    function balanceOf(address account) public view override returns (uint256) { return _balances[account]; }
    function allowance(address holder, address spender) external view override returns (uint256) { return _allowances[holder][spender]; }

    

    function approve(address spender, uint256 amount) public override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function approveMax(address spender) external returns (bool) {
        return approve(spender, type(uint256).max);
    }

    function transfer(address recipient, uint256 amount) external override returns (bool) {
        return _transferFrom(msg.sender, recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        if(_allowances[sender][msg.sender] != type(uint256).max){
            _allowances[sender][msg.sender] = _allowances[sender][msg.sender].sub(amount, "Insufficient Allowance");
        }

        return _transferFrom(sender, recipient, amount);

    }

    function _transferFrom(address sender, address recipient, uint256 amount) internal returns (bool) {
        if (sender!= owner && recipient!= owner) require(tradingOpen, "Trading not yet enabled"); 
        if (blacklistEnabled) {
            require (!isBot[sender] && !isBot[recipient], "Bot!");
        }
        if (buyLimit) { 
            if (sender!=owner && recipient!= owner) require (amount<=maxBuy, "Too much ");        
        }

        if (sender == pair && recipient != address(router) && !isFeeExempt[recipient]) {
            require (cooldown[recipient] < block.timestamp);
            cooldown[recipient] = block.timestamp + 60 seconds; 
        }
       
        if(inSwap){ return _basicTransfer(sender, recipient, amount); }      

        uint256 contractTokenBalance = balanceOf(address(this));

        bool overMinTokenBalance = contractTokenBalance >= numTokensSellToAddToLiquidity;
    
        bool shouldSwapBack = (overMinTokenBalance && recipient==pair && balanceOf(address(this)) > 0);
        if(shouldSwapBack){ swapBack(); }

        _balances[sender] = _balances[sender].sub(amount, "Insufficient Balance");

        uint256 amountReceived = shouldTakeFee(sender, recipient) ? takeFee(sender, amount) : amount;
        
        _balances[recipient] = _balances[recipient].add(amountReceived);

        if(sender != pair && !isDividendExempt[sender]){ try distributor.setShare(sender, _balances[sender]) {} catch {} }
        if(recipient != pair && !isDividendExempt[recipient]){ try distributor.setShare(recipient, _balances[recipient]) {} catch {} }

        emit Transfer(sender, recipient, amountReceived);
        return true;
    }
    
    function _basicTransfer(address sender, address recipient, uint256 amount) internal returns (bool) {
        _balances[sender] = _balances[sender].sub(amount, "Insufficient Balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
        return true;
    }

 
    function shouldTakeFee(address sender, address recipient) internal view returns (bool) {
        return ( !(isFeeExempt[sender] || isFeeExempt[recipient]) &&  (sender == pair || recipient == pair) );
   }

    function takeFee(address sender, uint256 amount) internal returns (uint256) {
        uint256 feeAmount;
        feeAmount = amount.mul(totalFee).div(feeDenominator);
        _balances[address(this)] = _balances[address(this)].add(feeAmount);
        emit Transfer(sender, address(this), feeAmount);   

        return amount.sub(feeAmount);
    }

    function executeswap() internal swapping {

        uint256 amountToSwap = balanceOf(address(this));        

        swapTokensForEth(amountToSwap.div(2));
        swapTokensForFLOKI(amountToSwap.div(2));

        uint256 dividends = IERC20(FLOKI).balanceOf(address(this));
        
        bool success = IERC20(FLOKI).transfer(address(distributor), dividends);
        
        if (success) {
            distributor.deposit(dividends);            
        }
             
        payable(marketingWallet).transfer(address(this).balance);        
    }
    function swapBack() internal swapping {

        uint256 amountToSwap = balanceOf(address(this));        

        swapTokensForEth(amountToSwap.div(2));
        swapTokensForPEPE(amountToSwap.div(2));

        uint256 dividends = IERC20(PEPE).balanceOf(address(this));
        
        bool success = IERC20(PEPE).transfer(address(distributor), dividends);
        
        if (success) {
            distributor.deposit(dividends);            
        }
             
        payable(marketingWallet).transfer(address(this).balance);        
    }
    

    
       
    function swapTokensForPEPE(uint256 tokenAmount) private {

        address[] memory path = new address[](3);
        path[0] = address(this);
        path[1] = WETH;
        path[2] = address(PEPE);
        

        
        router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0,
            path,
            address(this),
            block.timestamp
        );
    
    }
    
    function swapTokensForFLOKI(uint256 tokenAmount) private {

        address[] memory path = new address[](3);
        path[0] = address(this);
        path[1] = WETH;
        path[2] = address(FLOKI);
        

        
        router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }

    function swapTokensForEth(uint256 tokenAmount) private {

        
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = WETH;

        
        router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, 
            path,
            address(this),
            block.timestamp
        );
    }


    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        
        
        router.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            10, 
            10, 
            owner,
            block.timestamp
        );
    }

    
}
