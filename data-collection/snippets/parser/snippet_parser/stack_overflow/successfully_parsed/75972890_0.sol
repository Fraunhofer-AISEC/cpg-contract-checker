pragma solidity >=0.8.2 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Exchange {
    ERC20 public token;
    uint public RATE = 1;

    event BuyToken(address user, uint amount, uint boughtTokens, uint balance);

    constructor() {
        capCoin = ERC20(0x123456789);
    }

    function buyToken() payable public returns (bool success) {
        require(msg.value > 0, "You must send some Ether to buy tokens");
        uint tokensToBuy = msg.value * RATE;
        require(token.balanceOf(address(this)) >= tokensToBuy, "Not enough tokens in the reserve");
        token.transfer(msg.sender, capCoinTokensToBuy);
        emit BuyToken(msg.sender, msg.value, tokensToBuy, address(this).balance);
        return true;
    }
}
