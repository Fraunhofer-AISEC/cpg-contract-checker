pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/tree/v2.5.1/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/tree/v2.5.1/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/tree/v2.5.1/contracts/crowdsale/Crowdsale.sol";

contract BotSale is Crowdsale, MintedCrowdsale, CappedCrowdsale {
constructor (
uint256 rate,
address payable wallet,
IERC20 token,
uint256 cap
)
MintedCrowdsale()
Crowdsale(rate, wallet, token)
CappedCrowdsale(cap)
public
{

    }
}
