pragma solidity ^0.4.24;

import './Crowdsale.sol';
import './MintedCrowdsale.sol';
import './Ownable.sol';

contract myCrowdsale is Crowdsale, MintedCrowdsale, Ownable {

    constructor(uint256 _rate, address _wallet, ERC20 _token) Crowdsale(_rate, _wallet, _token) public {

    }

    function setRate(uint256 newRate) onlyOwner public {
        rate = newRate;
    }

}
