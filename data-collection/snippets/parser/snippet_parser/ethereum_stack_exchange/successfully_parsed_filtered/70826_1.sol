pragma solidity ^0.5.0;

import './MyToken.sol';
import "openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";

contract MyCrowdsale is Crowdsale {
  constructor(
      uint256 rate,    
      address payable wallet,
      MyToken token
  )
      Crowdsale(rate, wallet, token)
      public
  {

  }

}
