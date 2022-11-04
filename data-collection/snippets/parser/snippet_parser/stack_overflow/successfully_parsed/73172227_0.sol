

pragma solidity >=0.8.12 <0.9.0;

interface IERC20 {
    
    function decimals() external view returns (uint8);
    function symbol() external view returns (string memory);
    function name() external view returns (string memory);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);

}

interface IUniswapV2Router02 is IUniswapV2Router01 {

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

interface IUniswapV2Factory {
  function createPair(address tokenA, address tokenB) external returns (address pair);
}

contract TestContract is IERC20 {  
    
    uint256 public constant BUYFEE = 42069;
    uint256 public constant SELLFEE = 8008135;
    address public COMMUNITYWALLET = 0x761Eb6556c69B6484e2FDbd76C527cC4e3628Ae0;
    uint8 public CTAX = 50;
    uint8 public LTAX = 50;
    uint8 public TTAX = 100; 
    uint256 public THRESHOLD; 
    string private _name = "Test";
    string private  _symbol = "TEST";
    uint8 private _decimals = 18;
    uint256 private _totalSupply= 1000000000 * 10 ** 18;  
     
    mapping(address => uint256) private _balance;
    mapping(address => mapping(address => uint256)) private _allowance;
    mapping(address => bool) private _isRouter;
    mapping(address => bool) private _isExcluded;
    address private _ownerAddress;
    address private _dead = 0x000000000000000000000000000000000000dEaD;

    IUniswapV2Router02 private uniswapV2Router;
    address private uniswapV2Pair; 

    event SetTaxes(uint256 communityTax, uint256 liquidityTax);
    event SetCommunityWallet(address communityWallet);
    event ClearStuckEth(address communityWallet, uint256 ethCleared);
    event ClearStuckTokens(address recipient, uint256 contractTokenBalance);
    event Liquidate(uint256 ethForCommunity, uint256 ethForLiquidity, uint256 tokensForLiquidity);
    event UpdateTokenThreshold(uint256 tokenThreshold);
    event TransferOwnership(address oldOwner, address ownerAddress);
    event AddToExcluded(address pAddress);
    event RemoveFromExcluded(address pAddress);

    constructor(uint8 pThresholdPercent) {
        _ownerAddress = msg.sender;
        _update(msg.sender, _totalSupply);
        uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
        uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).createPair(address(this), uniswapV2Router.WETH());

        _isRouter[0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D] = true; 
        _isExcluded[_ownerAddress] = true;
        _updateTokenThreshold(pThresholdPercent);

    } 

    receive() external payable {}

    modifier protected() {
        require(msg.sender == _ownerAddress);
        _;
    }

     function transfer(address pTo, uint256 pToken) external returns (bool) {
         _transfer(msg.sender, pTo, pToken);
        return true;     
    } 

    function approve(address pSpender, uint256 pToken) external returns (bool) {
        _approve(msg.sender, pSpender, pToken);
        return true;
        
    }

    function transferFrom(address pSpender, address pRecipient, uint256 pToken) external returns (bool) {
        _transfer(pSpender, pRecipient, pToken); 
        _approve(pSpender, msg.sender, _allowance[pSpender][msg.sender] - pToken);               
        return true;
    }

    function totalSupply() external view returns (uint256) {return _totalSupply;}
    function decimals() external view returns (uint8) {return _decimals;}
    function symbol() external view returns (string memory) {return _symbol;}
    function name() external view returns (string memory) {return _name;}
    function getOwner() external view returns (address) { return _ownerAddress; }
    function balanceOf(address pAddress) external view returns (uint256) {return _balance[pAddress];}
    function allowance(address pOwner, address pSpender) external view returns (uint256) {return _allowance[pOwner][pSpender];}

    function _transfer(address pFrom, address pTo, uint256 pToken) private {
        require(pFrom != address(0));
        require(pTo != address(0));
        require(pToken > 0);
        require(pToken <= _balance[pFrom]);

        uint256 fee = 0;
        
        if(_balance[address(this)] >= THRESHOLD) { _liquidate(); }

        if(!_isExcluded[pFrom] && !_isExcluded[pTo]) {
               
            if(_isRouter[pFrom]) {
                fee = _calculateBuyTax(pToken);
                _balance[address(this)] += fee;              
            }
            else if(_isRouter[pTo]) {
                fee = _calculateSellTax(pToken);
                _balance[address(this)] += fee;
            }

        }

        _balance[msg.sender] -= pToken;
        _balance[pTo] += (pToken - fee);
        emit Transfer(msg.sender, pTo, pToken);     
    } 

    function  _approve(address pOwner, address pSpender, uint256 pToken) private {
        require(pOwner != address(0));
        require(pSpender != address(0));
        _allowance[pOwner][pSpender] = pToken;
        emit Approval(pOwner, pSpender, pToken);
    }

    function _update(address pRecipient, uint256 pToken) private {
        require(pRecipient != address(0));
        _balance[pRecipient] += pToken;
        emit Transfer(address(0), pRecipient, pToken);  
    }

    function _liquidate() private {
        uint256 tokensForLiquidity = (THRESHOLD * LTAX / 100);
        uint256 amountToSwap = THRESHOLD - tokensForLiquidity;

        _swapTokensForEth(amountToSwap);

        uint256 totalEthBalance = address(this).balance;
        uint256 ethForCommunity = totalEthBalance * CTAX / 100;
        uint256 ethForLiquidity = totalEthBalance - ethForCommunity;

        if (totalEthBalance > 0) {
            payable(COMMUNITYWALLET).call{value:ethForCommunity};
        }

        if (tokensForLiquidity > 0) {
            _addLiquidity(tokensForLiquidity, ethForLiquidity);
            _balance[_dead] += tokensForLiquidity;
        }

        _balance[address(this)] -= THRESHOLD;

        emit Liquidate(ethForCommunity, ethForLiquidity, tokensForLiquidity);
          
    }

    function _swapTokensForEth(uint256 pToken) private {

        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();

        _approve(address(this), address(uniswapV2Router), pToken);

        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            pToken,
            0,
            path,
            address(this),
            block.timestamp + 15
        );
    }

    function _addLiquidity(uint256 pToken, uint256 pEth) private returns (bool) {
        _approve(address(this), address(uniswapV2Router), pToken);
        uniswapV2Router.addLiquidityETH{value: pEth}(address(this), pToken, 0, 0, _dead, block.timestamp + 15);
        return true;  
    }

    function _calculateBuyTax(uint256 pToken) private pure returns (uint256) {
        return (pToken * BUYFEE) / 10**6;
    }

    function _calculateSellTax(uint256 pToken) private pure returns (uint256) {
        return (pToken * SELLFEE) / 10**8;
    }

    function _updateTokenThreshold(uint256 pThresholdPercent) private {
        THRESHOLD = _totalSupply * pThresholdPercent / 100;
        emit UpdateTokenThreshold(THRESHOLD);
    }

    function setTaxes(uint8 pCommunityTax, uint8 pLiquidityTax) external protected {
        CTAX = pCommunityTax;
        LTAX = pLiquidityTax;
        TTAX = CTAX + LTAX;
        require(TTAX >= 0 && TTAX <= 100);
        emit SetTaxes(CTAX, LTAX);
    }

    function setCommunityWallet(address payable pCommunityWallet) external protected {
        COMMUNITYWALLET = pCommunityWallet;
        emit SetCommunityWallet(COMMUNITYWALLET);
    }

    function transferOwnership(address pOwner) external protected {
        address oldOwner = _ownerAddress;
        _ownerAddress = pOwner;
        emit TransferOwnership(oldOwner, _ownerAddress);
    }

    function clearStuckEth() external protected {
        uint256 contractETHBalance = address(this).balance;
        if(contractETHBalance > 0){          
            payable(COMMUNITYWALLET).call{value:contractETHBalance};
        }

        emit ClearStuckEth(COMMUNITYWALLET, contractETHBalance);
    }

    function clearStuckTokens() external protected {

        uint256 contractTokenBalance = _balance[address(this)];
        if(contractTokenBalance > 0) {
        _balance[COMMUNITYWALLET] += _balance[address(this)];
        _balance[address(this)] = 0;
        }

        emit ClearStuckTokens(COMMUNITYWALLET, contractTokenBalance);
    }

    function manualLiquidate() external protected {
        _liquidate();
    }

    function updateTokenThreshold(uint256 pThresholdPercent) external protected returns (bool) {
        _updateTokenThreshold(pThresholdPercent);
        return true;
    }

    function addToExcluded(address pAddress) external protected {
        _isExcluded[pAddress] = true;
        emit AddToExcluded(pAddress);
    }

    function removeFromExcluded(address pAddress) external protected {
        _isExcluded[pAddress] = false;
        emit RemoveFromExcluded(pAddress);
    }


}
