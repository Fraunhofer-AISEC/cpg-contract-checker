pragma solidity ^0.4.24;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/master/contracts/crowdsale/Crowdsale.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/master/contracts/token/ERC20/ERC20.sol";

contract NourCrowdSale is Crowdsale {

  constructor (
    uint256 rate,
    address wallet,
    ERC20 token) public 
  Crowdsale(rate, wallet, token)
  {}
}
