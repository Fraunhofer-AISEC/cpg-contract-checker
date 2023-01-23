pragma solidity 0.8.4;


import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {
  uint256 public constant tokensPerEth = 100;
  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

  YourToken public yourToken;

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  function buyTokens() public payable {
    uint256 tokensAmount = tokensPerEth * msg.value;
    yourToken.transfer(msg.sender,tokensAmount);
    emit BuyTokens(msg.sender,msg.value,tokensAmount);
  }

}

