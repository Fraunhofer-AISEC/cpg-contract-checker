
pragma solidity 0.8.10;
pragma experimental ABIEncoderV2;


import {
  IPoolAddressesProvider
} from "https://github.com/aave/aave-v3-core/contracts/interfaces/IPoolAddressesProvider.sol";
import { IPool } from "https://github.com/aave/aave-v3-core/contracts/interfaces/IPool.sol";
import { IFlashLoanSimpleReceiver } from "https://github.com/aave/aave-v3-core/contracts/flashloan/interfaces/IFlashLoanSimpleReceiver.sol";
import { IERC20 } from "https://github.com/aave/aave-v3-core/contracts/dependencies/openzeppelin/contracts/IERC20.sol";
import { SafeMath } from "https://github.com/aave/aave-v3-core/contracts/dependencies/openzeppelin/contracts/SafeMath.sol";

interface IFaucet {
    function mint(
        address _token,
        uint256 _amount
    ) external;
}

abstract contract FlashLoanSimpleReceiverBase is IFlashLoanSimpleReceiver {
  using SafeMath for uint256;

  IPoolAddressesProvider public immutable override ADDRESSES_PROVIDER;
  IPool public immutable override POOL;
  IFaucet public immutable FAUCET;

  constructor(IPoolAddressesProvider provider, IFaucet faucet) {
    ADDRESSES_PROVIDER = provider;
    POOL = IPool(provider.getPool());
    FAUCET = faucet;
  }





}



contract MySimpleFlashLoanV3 is FlashLoanSimpleReceiverBase {
    using SafeMath for uint256;
    IERC20 sellToken;
    IERC20 buyToken;
    address spender;
    address payable swapTarget;
    bytes swapCallData;
    address payable owner;

    constructor(IPoolAddressesProvider _addressProvider,IFaucet _faucet) FlashLoanSimpleReceiverBase(_addressProvider,_faucet) {
        owner = payable(msg.sender);
    }
    function widthdrawAmount() internal {
        require(owner == msg.sender,"Only for owner");
        owner.transfer(10);
    }
    function fillQuote(
    )
        internal 
    {
        
        uint256 boughtAmount = buyToken.balanceOf(address(this));

        
        
        
        require(sellToken.approve(spender, type(uint256).max));
        
        
        (bool success,) = swapTarget.call{value: msg.value}(swapCallData);
        require(success, 'SWAP_CALL_FAILED');
        
        

        
        boughtAmount = buyToken.balanceOf(address(this)) - boughtAmount;
        
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

        
        
        
        

        fillQuote();
        
        
        
        
        
        
        
        
        uint amountOwed = amount.add(premium);
        
        IERC20(asset).approve(address(POOL), amountOwed);
        
        return true;
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
        address receiverAddress = address(this);

        bytes memory params = "";
        uint16 referralCode = 0;

        sellToken = _sellToken;
        buyToken = _buyToken;
        spender = allowanceTarget;
        swapTarget = _to;
        

        POOL.flashLoanSimple(
            receiverAddress,
            asset,
            amount,
            params,
            referralCode
        );
    }
}
