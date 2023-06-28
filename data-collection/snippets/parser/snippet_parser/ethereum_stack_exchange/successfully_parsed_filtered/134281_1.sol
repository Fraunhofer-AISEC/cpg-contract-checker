
pragma solidity 0.8.10;
pragma experimental ABIEncoderV2;


import {
  IPoolAddressesProvider
} from "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import { IPool } from "@aave/core-v3/contracts/interfaces/IPool.sol";
import { IFlashLoanSimpleReceiver } from "@aave/core-v3/contracts/flashloan/interfaces/IFlashLoanSimpleReceiver.sol";
import { IERC20 } from "@aave/core-v3/contracts/dependencies/openzeppelin/contracts/IERC20.sol";
import { SafeMath } from "@aave/core-v3/contracts/dependencies/openzeppelin/contracts/SafeMath.sol";








abstract contract FlashLoanSimpleReceiverBase is IFlashLoanSimpleReceiver {
  using SafeMath for uint256;

  IPoolAddressesProvider public immutable override ADDRESSES_PROVIDER;
  IPool public immutable override POOL;








  constructor(IPoolAddressesProvider provider) {
    ADDRESSES_PROVIDER = provider;
    POOL = IPool(provider.getPool());
  }
}



contract MySimpleFlashLoanV3 is FlashLoanSimpleReceiverBase {
    using SafeMath for uint256;
    IERC20 sellToken;
    IERC20 buyToken;
    address spender;
    address payable swapTarget;
    bytes swapCallData;

    constructor(IPoolAddressesProvider _addressProvider) FlashLoanSimpleReceiverBase(_addressProvider) {}

    function fillQuote(
    )
        internal 
    {
        
    }
    
    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    )
        external
        override
        returns (bool)
    {

    }

    function executeFlashLoan(
        address asset,
        uint256 amount,
        IERC20 _sellToken,
        
        IERC20 _buyToken,
        
        address allowanceTarget,
        
        address payable _to,
        
        bytes calldata _data
    ) public {
 
    }
}
