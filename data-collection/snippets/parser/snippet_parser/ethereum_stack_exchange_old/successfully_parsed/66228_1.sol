pragma solidity ^0.4.24;

import "../node_modules/openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "./POPCoin.sol";


contract PopCoinCrowdsale is Crowdsale {

    constructor(uint256 rate, address wallet, IERC20 token) 
        Crowdsale(rate, wallet, token) public {

        }        
}
