pragma solidity ^0.4.19;

import "zeppelin-solidity/contracts/crowdsale/CappedCrowdsale.sol";



contract DollarCappedCrowdsale is CappedCrowdsale(1), Ownable {
  uint256 public ethPriceInDollars;
  uint256 public hardCapInDollars;
  uint256 public tokenPriceInCents;

  
  
  function DollarCappedCrowdsale(
    uint256 _startTime,
    uint256 _endTime,
    address _wallet,
    uint256 _ethPriceInDollars,
    uint256 _hardCapInDollars,
    uint256 _tokenPriceInCents
    )
    public
    Crowdsale(_startTime, _endTime, 1, _wallet)
  {
    require(_hardCapInDollars > 0);
    require(_tokenPriceInCents > 0);
    hardCapInDollars = _hardCapInDollars;
    tokenPriceInCents = _tokenPriceInCents;
    updateEthPrice(_ethPriceInDollars);
  }

  function updateEthPrice(uint256 _ethPriceInDollars) public onlyOwner {
    require(now < startTime);
    require(_ethPriceInDollars > 0);
    ethPriceInDollars = _ethPriceInDollars;
    cap = (hardCapInDollars / ethPriceInDollars).mul(1 ether);
    rate = (ethPriceInDollars.mul(100)) / tokenPriceInCents;
  }
}
