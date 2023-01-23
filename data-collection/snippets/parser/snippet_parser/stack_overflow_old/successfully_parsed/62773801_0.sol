pragma solidity ^0.5.0;

import "./Token.sol";



contract Crowdsale {

    constructor() public {
        rate = 100;
        on = true;
    }

    Token public token;
    address payable wallet;
    uint256 public rate;
    bool on;

    event TokenPurchase(address recipient, uint256 numPaid, uint256 numTokensPurchased);

    function buyTokens() public payable {
        
        require(msg.value > 0 && on == true);
        uint256 tokenAmount = _getTokenAmount(msg.value);
        require(token.balanceOf(address(this)) >= tokenAmount);
        token.transfer(msg.sender, tokenAmount);
        emit TokenPurchase( msg.sender, msg.value, tokenAmount);

    }
    
    function () external payable{
        buyTokens();
    }
}