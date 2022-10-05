pragma solidity >= 0.4.22;

import "./Untitled.sol";

contract subm{
  address winner;
  reg public regi;

  mapping (address => uint256) public balance;

  function submissions() public{
    if (winner == address(0)){
        winner = msg.sender;
    }
    else {
        return;
    }
  }
}
