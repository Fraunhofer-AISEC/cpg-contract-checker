pragma solidity ^0.8.5;

import 'https://github.com/OpenZeppelin/openzeppelin- 
contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract Token is ERC20 {

   constructor() ERC20('My Token', 'TTT') {
       _mint(msg.sender, 10000 * 10 ** 18);
   }

}
