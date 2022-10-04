
pragma solidity 0.8.0;

import { FlashLoanReceiverBase } from "./FlashLoanReceiverBase.sol";
import { ILendingPool, ILendingPoolAddressesProvider, IERC20 } from "./MyInterfaces.sol";
import { SafeMath } from "./MyLibraries.sol";

import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";

contract FlashLoanV5 is FlashLoanReceiverBase {
    address constant kovanDAI = address(0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD);
    address constant uniswapRouterAddress = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    
    IUniswapV2Router02 private uniswapRouter;
    IERC20 private DAI;
    
    using SafeMath for uint256;
    
    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
    
    constructor(ILendingPoolAddressesProvider _addressProvider) FlashLoanReceiverBase(_addressProvider) public {
        uniswapRouter = IUniswapV2Router02(uniswapRouterAddress);
        DAI = IERC20(kovanDAI);
    }
    
    
    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    )
        external
        override
        returns (bool)
    {   
        
        uint256 loanAmount = amounts[0];
        uniswapSwap(loanAmount);
        
        
        for (uint i = 0; i < assets.length; i++) {
            uint amountOwing = amounts[i].add(premiums[i]);
            IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);
        }

        return true;
    }
    
    
    function myFlashLoanCall(uint256 loanAmount) public {
        address receiverAddress = address(this);

        address[] memory assets = new address[](1);
        assets[0] = kovanDAI;

        uint256[] memory amounts = new uint256[](1);
        amounts[0] = 1 ether;
        amounts[0] = amounts[0] * loanAmount;

        
        uint256[] memory modes = new uint256[](1);
        modes[0] = 0;

        address onBehalfOf = address(this);
        bytes memory params = "";
        uint16 referralCode = 0;

        LENDING_POOL.flashLoan(
            receiverAddress,
            assets,
            amounts,
            modes,
            onBehalfOf,
            params,
            referralCode
        );
    }
    
    
    
    
    function uniswapSwap(uint256 daiAmount) public payable {
        
        uint256 amountIn = daiAmount;
        
        
        require(DAI.approve(address(uniswapRouter), amountIn), 'approve failed.');
        
        address[] memory path = new address[](2);
        path[0] = address(DAI);
        path[1] = uniswapRouter.WETH();
        uint deadline = block.timestamp + 15;
        uint[] memory amounts = uniswapRouter.swapExactTokensForETH(daiAmount, 0, path, address(this), deadline);
        
    }
}
