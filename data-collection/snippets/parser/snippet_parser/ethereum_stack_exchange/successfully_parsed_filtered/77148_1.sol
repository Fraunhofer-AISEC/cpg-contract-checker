pragma solidity ^0.5.0;

import "./Crowdsale.sol";

contract MyCrowdsale is Crowdsale {
  constructor (
    uint256 rate,
    address payable wallet,
    IERC20 token
  ) 
  public
  Crowdsale(1000000000, wallet, token)
  {
  }
}
