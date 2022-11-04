
pragma solidity ^0.6.6;

import "@aave/protocol-v2/contracts/flashloan/base/FlashLoanReceiverBase.sol";
import "@aave/protocol-v2/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "@aave/protocol-v2/contracts/interfaces/ILendingPool.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import {SafeERC20} from "@aave/protocol-v2/contracts/dependencies/openzeppelin/contracts/SafeERC20.sol";




contract FlashloanV2 is FlashLoanReceiverBase {

    using SafeERC20 for IERC20;

    constructor(
        ILendingPoolAddressesProvider _addressProvider,
        address _routerA, 
        address _routerB,
        address _token,
        address _WETH
    ) public FlashLoanReceiverBase(_addressProvider)
    {   
        owner = msg.sender;
        routerA = _routerA;
        routerB = _routerB;
        token = _token;
        WETH = _WETH;
    }

    address owner;
    address routerA;
    address routerB;
    address token;
    address WETH;


     modifier onlyOwner{
        require(msg.sender == owner, "Hey hey hey you can't use this function");
        _;
     }

    
    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        
        
        
        

        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = WETH;

        address[] memory path2 = new address[](2);
        path2[0] = WETH;
        path2[1] = token;

        uint balance = address(this).balance;
        IERC20(WETH).approve(routerA, balance);  

        IUniswapV2Router02(routerA).swapExactTokensForTokensSupportingFeeOnTransferTokens(
            balance, 
            0, 
            path2, 
            address(this), 
            block.timestamp + 1200
        );

        uint tokenBalance = IERC20(token).balanceOf(address(this));
        IERC20(token).approve(routerB, tokenBalance);

        IUniswapV2Router02(routerB).swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenBalance, 
            0, 
            path, 
            address(this), 
            block.timestamp + 1200
        );

        
        
        
        
        
        

        
        for (uint256 i = 0; i < assets.length; i++) {
            uint256 amountOwing = amounts[i].add(premiums[i]);
            IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);
        }

        return true;
    }

    function _flashloan(address[] memory assets, uint256[] memory amounts)
        internal
    {
        address receiverAddress = address(this);

        address onBehalfOf = address(this);
        bytes memory params = "";
        uint16 referralCode = 0;

        uint256[] memory modes = new uint256[](assets.length);

        
        for (uint256 i = 0; i < assets.length; i++) {
            modes[i] = 0;
        }

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

    
    function flashloan(address[] memory assets, uint256[] memory amounts)
        public
        onlyOwner
    {
        _flashloan(assets, amounts);
    }

    
    function flashloan(address _asset) public onlyOwner {
        bytes memory data = "";
        uint256 amount = 50 ether;

        address[] memory assets = new address[](1);
        assets[0] = _asset;

        uint256[] memory amounts = new uint256[](1);
        amounts[0] = amount;

        _flashloan(assets, amounts);
    }

        event LogWithdraw(
        address indexed _from,
        address indexed _assetAddress,
        uint amount
    );

    
    function withdraw(address _assetAddress) public onlyOwner {
        uint assetBalance;
        if (_assetAddress == WETH) {
            address self = address(this); 
            assetBalance = self.balance;
            payable(msg.sender).transfer(assetBalance);
        } else {
            assetBalance = IERC20(_assetAddress).balanceOf(address(this));
            IERC20(_assetAddress).safeTransfer(msg.sender, assetBalance);
        }
        emit LogWithdraw(msg.sender, _assetAddress, assetBalance);
    }

    function setter(address _routerA, address _routerB, address _token) external onlyOwner returns(bool){
        routerA = _routerA;
        routerB = _routerB;
        token = _token;
        return true;
    }

    function returnOwner() external view returns(address){
        return owner;
    }

    function returnToken() external view returns(address){
        return token;
    }

    function returnWETH() external view returns(address){
        return WETH;
    }

    fallback() external payable {}
}

