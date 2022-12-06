pragma solidity ^0.4.24;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/master/contracts/token/ERC20/ERC20.sol";

contract NourToken is ERC20 {
   string public symbol = "NOR";
   string public name = "Nourreddine Token";
   uint8 public decimals = 18;
   uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

   constructor() public {
      _mint(msg.sender, INITIAL_SUPPLY);
   }
}
