
pragma solidity 0.6.12;

import { FlashLoanReceiverBase } from "./FlashLoanReceiverBase.sol";
import { ILendingPool, ILendingPoolAddressesProvider, IERC20 } from "./Interfaces.sol";
import { SafeMath } from "./Libraries.sol";
import "./Ownable.sol";


contract BatchFlashDemo is FlashLoanReceiverBase, Ownable {
    
    ILendingPoolAddressesProvider provider;
    using SafeMath for uint256;
    uint256 flashDaiAmt0;
    address lendingPoolAddr;
    
    
    address mumbaiDai = 0x001B3B4d0F3714Ca98ba10F6042DaEbF0B1B7b6F;

    
    
    constructor(ILendingPoolAddressesProvider _addressProvider) FlashLoanReceiverBase(_addressProvider) public {
        provider = _addressProvider;
        lendingPoolAddr = provider.getLendingPool();
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
        
        

        
        
        for (uint i = 0; i < assets.length; i++) {
            uint amountOwing = amounts[i].add(premiums[i]);
            IERC20(assets[i]).approve(address(_lendingPool), amountOwing);
        }

        return true;
    }

    
    
    
    function executeFlashLoans(uint256 _flashDaiAmt0) public onlyOwner {
        address receiverAddress = address(this);

        
        address[] memory assets = new address[](1);
        assets[0] = mumbaiDai; 

        
        
        uint256[] memory amounts = new uint256[](1);
        amounts[0] = _flashDaiAmt0;

        flashDaiAmt0 = _flashDaiAmt0;

        
        uint256[] memory modes = new uint256[](1);
        modes[0] = 0;

        address onBehalfOf = address(this);
        bytes memory params = "";
        uint16 referralCode = 0;

        _lendingPool.flashLoan(
            receiverAddress,
            assets,
            amounts,
            modes,
            onBehalfOf,
            params,
            referralCode
        );
    }
    
        
    
    function rugPull() public payable onlyOwner {
        
        
        msg.sender.call{ value: address(this).balance }("");
        
        
        IERC20(mumbaiDai).transfer(msg.sender, IERC20(mumbaiDai).balanceOf(address(this)));
    }
    
}
