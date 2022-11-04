
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyContract{

  function transferTokens(address token, address recipient, uint256 amount) payable external {
    IERC20 token_ = IERC20(token);
      token_.transferFrom(msg.sender, recipient, amount);
    }
  }
