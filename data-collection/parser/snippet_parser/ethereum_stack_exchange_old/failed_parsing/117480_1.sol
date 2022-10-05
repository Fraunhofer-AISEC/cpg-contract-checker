pragma solidity ^0.8.5;

import 'https://github.com/OpenZeppelin/openzeppelin- 
contracts/blob/master/contracts/token/ERC20/IERC20.sol';
import 'Token.sol';
import 'Owner.sol';

contract TransferToken {

   function transfer() external {
       Token token = Token(Token.sol Contract Address);
       token.transfer(msg.sender, 100);
   }

   function transferFrom(address recipient, uint256 amount) external {
       Token token = Token(Token.sol Contract Address);
       token.transferFrom(msg.sender, recipient, amount );

   }

}
