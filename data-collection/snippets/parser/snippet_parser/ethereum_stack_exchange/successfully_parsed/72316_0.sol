pragma solidity 0.5.3;

import "./ERC20.sol";

contract Transfer {

  ERC20 private erc20iface;
  address private _owner;

  modifier validOwner() {
    require(msg.sender == _owner);
    _;
  }

  constructor() public {
    _owner = msg.sender;
  }

  function () external payable {}

  function transferTo(address[] memory receivers, uint[] memory amounts, address token) {
    
    }
 }
