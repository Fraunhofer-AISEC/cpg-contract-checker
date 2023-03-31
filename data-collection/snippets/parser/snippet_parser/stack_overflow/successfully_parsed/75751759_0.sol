 
pragma solidity ^0.8.17;

import "./token.sol";

contract TokenSwap {
    address public admin;
    Token public token;
    uint public tokenPrice;
    uint public tokensSold;
    uint public feePercent;
    address public feeAddress;

    event Sell(address indexed _buyer, uint _amount);

    constructor(Token _token, uint _tokenPrice,uint _feePercent, address _feeAddress) {
        admin = msg.sender;
        token = _token;
        tokenPrice = _tokenPrice;
        feePercent = _feePercent;
        feeAddress = _feeAddress;
    }

    function buyTokens(uint _numberOfTokens) public payable {
        uint totalFee = (_numberOfTokens * feePercent)/100;
        uint totalAmount = (_numberOfTokens-totalFee)* tokenPrice;

        require(msg.value >= totalAmount, "Invalid amount of ether sent");
        require(token.balanceOf(address(this)) >= _numberOfTokens, "Insufficient tokens in contract");
        require(token.transfer(msg.sender, _numberOfTokens - totalFee), "Token transfer failed");
        require(token.transfer(feeAddress, totalFee),"Token transfer failed");
        tokensSold += _numberOfTokens - totalFee;
        emit Sell(msg.sender, _numberOfTokens-totalFee);
    }

    function endSale() public {
        require(msg.sender == admin, "Only admin can end sale");
        require(token.transfer(admin, token.balanceOf(address(this))), "Token transfer failed");
        payable(admin).transfer(address(this).balance);
        selfdestruct(payable(admin));
    }
}
