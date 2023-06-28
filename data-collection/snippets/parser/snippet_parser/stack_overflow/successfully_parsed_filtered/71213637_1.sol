pragma solidity ^0.8.12;

import "./pSDAToken.sol";


contract pSDATokenSale {
    address admin;
    pSDA public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    function pSDAToken(pSDA _tokenContract, uint256 _tokenPrice)
        public
    {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
}