
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Staking {
  address owner;
  mapping(bytes32 => address) public whitelistedTokens;
  mapping(address => mapping(bytes32 => uint256)) public accountBalances;

  constructor() {
    owner = msg.sender;
  }

  function whitelistToken(bytes32 symbol, address tokenAddress) external {
    require(msg.sender == owner, "This function is not public");

    whitelistedTokens[symbol] = tokenAddress;
  }

  function getWhitelistedTokenAddresses(bytes32 token) external returns(address) {
    return whitelistedTokens[token];
  }

  function depositTokens(uint256 amount, bytes32 symbol) external payable {
    accountBalances[msg.sender][symbol] += amount;
    ERC20(whitelistedTokens[symbol]).transferFrom(msg.sender, address(this), amount);
  }

  function withdrawTokens(uint256 amount, bytes32 symbol) external {
    require(accountBalances[msg.sender][symbol] >= amount, 'Insufficent funds');

    accountBalances[msg.sender][symbol] -= amount;
    ERC20(whitelistedTokens[symbol]).transfer(msg.sender, amount);
  }
}
