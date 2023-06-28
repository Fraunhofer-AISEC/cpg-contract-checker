
pragma solidity 0.8.7;

import "./Token.sol";

contract KIA is Token {
    Token private token;

    constructor(
        address owner,
        uint256 initSupply,
        string memory tokenName,
        string memory tokenSymbol,
        uint8 decimalUnits
    ) Token(owner, initSupply, tokenName, tokenSymbol, decimalUnits) {}

    function ownerToken() external view returns (address) {
        return token.owner();
    }

    function BuyToken(uint256 rate) external payable {
        uint256 tokenAmount = msg.value * rate;
        token.transfer(msg.sender, tokenAmount);
    }
}
