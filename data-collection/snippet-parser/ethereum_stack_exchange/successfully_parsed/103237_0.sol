pragma solidity ^0.5.5;

import '@openzeppelin/contracts/crowdsale/Crowdsale.sol';
import '@openzeppelin/contracts/crowdsale/emission/AllowanceCrowdsale.sol';
import '@openzeppelin/contracts/crowdsale/validation/TimedCrowdsale.sol';
import '@openzeppelin/contracts/crowdsale/distribution/PostDeliveryCrowdsale.sol';
import '@openzeppelin/contracts/crowdsale/price/IncreasingPriceCrowdsale.sol';

contract MyCrowdsale is Crowdsale, TimedCrowdsale, AllowanceCrowdsale, PostDeliveryCrowdsale, IncreasingPriceCrowdsale {
    constructor(
        uint256 openingTime,
        uint256 closingTime,
        uint256 initialRate,
        uint256 finalRate,
        address payable wallet,
        IERC20 token
    )
    public
    Crowdsale(initialRate, wallet, token)
    TimedCrowdsale(openingTime, closingTime)
    IncreasingPriceCrowdsale(initialRate, finalRate)
    AllowanceCrowdsale(wallet)
    PostDeliveryCrowdsale()
    {

    }
}
