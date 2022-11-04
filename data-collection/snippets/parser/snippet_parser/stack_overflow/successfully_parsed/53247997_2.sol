pragma solidity ^0.4.24;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/release-v2.0.0/contracts/crowdsale/Crowdsale.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/release-v2.0.0/contracts/token/ERC20/ERC20.sol";
import "browser/NourToken.sol";

contract NourCrowdSale is Crowdsale {

   constructor (
      uint256 rate,
      address wallet) public 
   Crowdsale(rate, wallet, new NourToken()){}
}
