pragma solidity 0.5.2;

import "openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";

contract TestCrowdsale is Crowdsale, TimedCrowdsale, CappedCrowdsale, MintedCrowdsale {

  constructor(
    uint256 rate,
    address payable wallet,
    IERC20 token,
    uint256 openingTime,
    uint256 closingTime, 
    uint256 cap 
    )

    Crowdsale(rate, wallet, token)
    TimedCrowdsale(openingTime, closingTime)
    CappedCrowdsale(cap)

    public 
    { 

    }
}
