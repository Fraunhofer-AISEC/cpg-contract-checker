pragma solidity ^0.4.24;

import "./crowdsale/distribution/RefundableCrowdsale.sol";
import "./crowdsale/distribution/PostDeliveryCrowdsale.sol";
import "./crowdsale/validation/CappedCrowdsale.sol";
import "./crowdsale/emission/AllowanceCrowdsale.sol";
import "./crowdsale/emission/StagedCrowsale.sol";

contract SportistCrowdsale is RefundableCrowdsale, CappedCrowdsale, PostDeliveryCrowdsale, AllowanceCrowdsale, StagedCrowsale {
    constructor(
        uint256 rate, address wallet, IERC20 token,
        uint256 openingTime, uint256 closingTime,
        uint cap,
        uint256 goal,
        address tokenWallet) 
        Crowdsale(rate, wallet, token)
        TimedCrowdsale(openingTime, closingTime)
        CappedCrowdsale(cap)
        RefundableCrowdsale(goal)
        AllowanceCrowdsale(tokenWallet)
        StagedCrowsale()
    public {}

    function() external payable {
        buyTokens(msg.sender);
    }
}
