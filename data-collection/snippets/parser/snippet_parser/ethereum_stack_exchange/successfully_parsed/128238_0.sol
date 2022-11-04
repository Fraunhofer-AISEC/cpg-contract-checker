pragma solidity ^0.8.0;

import "https://github.com/kklau2013/HelloFlashLoan/blob/main/contracts/v1/aave/FlashLoanReceiverBaseV1.sol";
import "https://github.com/kklau2013/HelloFlashLoan/blob/main/interfaces/v1/ILendingPoolAddressesProviderV1.sol";
import "https://github.com/kklau2013/HelloFlashLoan/blob/main/interfaces/v1/ILendingPoolV1.sol";

contract FlashloanV1 is FlashLoanReceiverBaseV1 {

    constructor(address _addressProvider) FlashLoanReceiverBaseV1(_addressProvider) public {}

    
    function executeOperation(
        address _reserve,
        uint256 _amount,
        uint256 _fee,
        bytes calldata _params
    )
        external
        override
    {
        require(_amount <= getBalanceInternal(address(this), _reserve), "Invalid balance, was the flashLoan successful?");

        
        
        
        

        uint totalDebt = _amount.add(_fee);
        transferFundsBackToPoolInternal(_reserve, totalDebt);
    }

    
    function flashloan(address _asset) public onlyOwner {
        bytes memory data = "";
        uint amount = 1 ether;

        ILendingPoolV1 lendingPool = ILendingPoolV1(addressesProvider.getLendingPool());
        lendingPool.flashLoan(address(this), _asset, amount, data);
    }
}
