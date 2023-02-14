pragma solidity ^0.8.17;

import "@openzeppelin/contracts/interfaces/IERC721.sol";

contract Example {

  function walletHoldsToken() public view returns (bool) {
    return IERC721(0x1615600fE62ed38342F82eb9785029A2b1290DAF).balanceOf(msg.sender) > 0
  }

}
