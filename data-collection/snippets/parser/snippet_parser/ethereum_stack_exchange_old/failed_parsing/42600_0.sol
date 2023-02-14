pragma solidity ^0.4.18;

import './DeveloperToken.sol';
import 'zeppelin-solidity/contracts/crowdsale/CappedCrowdsale.sol';
import 'zeppelin-solidity/contracts/crowdsale/RefundableCrowdsale.sol';

contract DeveloperCrowdsale is CappedCrowdsale, RefundableCrowdsale {
