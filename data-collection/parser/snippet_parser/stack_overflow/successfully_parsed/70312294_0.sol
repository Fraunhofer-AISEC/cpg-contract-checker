pragma solidity 0.8.1;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SonnyCoin is ERC20 {
      constructor(uint256 initialValue) public ERC20("SonnyCoin", "SCN") {
             _mint(msg.sender, initialValue);
      }
}

