
pragma solidity ^0.8.11;
pragma abicoder v2;

import {IERC20} from "./interfaces/IERC20.sol";

import {FlashLoanReceiverBase} from "./utils/FlashLoanReceiverBase.sol";
import {ILendingPoolAddressesProvider} from "./interfaces/ILendingPoolAddressesProvider.sol";
import {ILendingPool} from "./interfaces/ILendingPool.sol";

import "./interfaces/ISwapRouter.sol";
import "./libraries/TransferHelper.sol";

import "./interfaces/IUniswapV2Router02.sol";

contract Arbitrage is FlashLoanReceiverBase {
    address public immutable minter;

    struct SwapInfo {
        address router;
        address tokenIn;
        uint24 poolFee;
        bool isV3;
    }
    struct ArbitInfo {
        SwapInfo buy;
        SwapInfo sell;
    }

    constructor(address _flashAddrProvider) FlashLoanReceiverBase(_flashAddrProvider) {
        minter = msg.sender;
    }

    modifier minterOnly {
        require(msg.sender == minter, "MO"); 
        _;
    }

    function execute(ArbitInfo memory _data, uint256 _amount) external {
        ILendingPool lendingPool = ILendingPool(addressesProvider.getLendingPool());
        lendingPool.flashLoan(address(this), _data.buy.tokenIn, _amount, abi.encode(_data));
    }

    function cashOut(address _token, address _receiver) external minterOnly {
        uint256 bal = IERC20(_token).balanceOf(address(this));
        require(bal > 0, "CO: NEF"); 

        TransferHelper.safeTransfer(_token, _receiver, bal);
    }

    
    function executeOperation(address _reserve, uint256 _amount, uint256 _fee, bytes calldata _params) external {
        require(msg.sender == addressesProvider.getLendingPool(), "MC"); 
        require(_amount <= getBalanceInternal(address(this), _reserve), "IIB"); 

        
        ArbitInfo memory decoded = abi.decode(_params, (ArbitInfo));

        
        uint256 sellAmount;
        
        if (decoded.buy.isV3) {
            
            sellAmount = swapV3(decoded.buy.router, _reserve, decoded.sell.tokenIn, decoded.buy.poolFee, _amount);
        } else {
            
            sellAmount = swapV2(decoded.buy.router, _reserve, decoded.sell.tokenIn, _amount);
        }

        
        
        if (decoded.sell.isV3) {
            
            swapV3(decoded.sell.router, decoded.sell.tokenIn, _reserve, decoded.sell.poolFee, sellAmount);
        } else {
            
            swapV2(decoded.sell.router, decoded.sell.tokenIn, _reserve, sellAmount);
        }
        
        
        uint256 totalDebt = _amount + _fee;
        transferFundsBackToPoolInternal(_reserve, totalDebt);
    }

    
    function swapV3(address _router, address _in, address _out, uint24 _fee, uint256 _amount) private returns (uint256) {
        
        require(_amount > 0, "V3: NA"); 
        require(IERC20(_in).balanceOf(address(this)) >= _amount, "V3: NEF"); 
        
        TransferHelper.safeApprove(_in, address(_router), _amount);

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams({
            tokenIn: _in,
            tokenOut: _out,
            fee: _fee,
            recipient: msg.sender,
            deadline: block.timestamp,
            amountIn: _amount,
            amountOutMinimum: 0,
            sqrtPriceLimitX96: 0
        });

        uint256 output = ISwapRouter(_router).exactInputSingle(params);
        return output;
    }

    function swapV2(address _router, address _in, address _out, uint256 _amount) private returns (uint256) {
        
        require(_amount > 0, "V2: NA"); 
        require(IERC20(_in).balanceOf(address(this)) >= _amount, "V2: NEF"); 
        
        TransferHelper.safeApprove(_in, address(_router), _amount);

        address[] memory path = new address[](2);
        path[0] = _in;
        path[1] = _out;

        require(IERC20(_in).approve(_router, _amount), "V2: AF"); 
        uint[] memory output = IUniswapV2Router02(_router).swapExactTokensForTokens(_amount, 0, path, msg.sender, block.timestamp);
        return output[0];
    }
}
