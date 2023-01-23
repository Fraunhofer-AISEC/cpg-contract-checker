pragma solidity >=0.4.20;

import "./../node_modules/augur/source/contracts/trading/CompleteSets.sol";
import "./../node_modules/augur/source/contracts/reporting/IMarket.sol";

contract BuyCompleteAugurSets {
  CompleteSets completeSetsInstance

  function BuyCompleteAugurSets(address _completeSetsAddress) 
  public
  {
    completeSetsInstance = CompleteSets(_completeSetsAddress);
  }

  function buyAugurShares (
    IMarket _market
  )
  public 
  payable
  {
    uint256 amount = 10 ** 14;
    completeSetsInstance.publicBuyCompleteSets.value(1 ether)(_market, amount);
  }
}
