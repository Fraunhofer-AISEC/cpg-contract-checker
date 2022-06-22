pragma solidity 0.6.12;  
import { FlashLoanReceiverBase } from "https://github.com/aave/flashloan-box/blob/Remix/contracts/aave/FlashLoanReceiverBase.sol";  
import { ILendingPool } from "https://github.com/aave/flashloan-box/blob/Remix/contracts/aave/ILendingPool.sol";  
import { ILendingPoolAddressesProvider } from "https://github.com/aave/flashloan-box/blob/Remix/contracts/aave/ILendingPoolAddressesProvider.sol";  
import { IERC20 } from "https://github.com/alcueca/ERC3156/blob/main/contracts/ERC20.sol";  
  
contract MyV2FlashLoan is FlashLoanReceiverBase {  
   
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
        
        
        
        
        
        
        
        
        
        
        
        for (uint i = 0; i < assets.length; i++) {  
            uint amountOwing = amounts[i].add(premiums[i]);  
            IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);  
        }  
        
        return true;  
    }  
}
