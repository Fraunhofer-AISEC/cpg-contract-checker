pragma solidity ^0.5.0;


import 
"https://github.com/aave/aave-protocol/blob/master/contracts/configuration/LendingPoolAddressesProvider.sol"
;
import 
"https://github.com/aave/aave-protocol/blob/master/contracts/lendingpool/LendingPool.sol"
;
import 
"https://github.com/aave/aave-protocol/blob/master/contracts/flashloan/base/FlashLoanReceiverBase.sol"
;



contract borower is FlashLoanReceiverBase {

address owner;
LendingPoolAddressesProvider myProvider;
address usdc;

constructor(address _provider, address _usdc) FlashLoanReceiverBase(_provider) public {
     owner = msg.sender;
      myProvider = LendingPoolAddressesProvider(_provider);
      usdc = _usdc;
}
    modifier onlyOwner {
    
    }


   function startFlashLoan(uint amount, bytes calldata _params) external onlyOwner {
    require(msg.sender = owner);

    lendingPool lendingPool = myProvider.getLendingPool();
    lendingPool.flashloan(address(0xE17a5B6535E723725aa2C42643e7906192f341fD), usdc, amount, _params);

   }

   function executeOperation(address _reserve , uint amount, uint _fee, bytes) external {

       transferFundsBackToPoolInternal(_reserve, amount + _fee);
}
}
