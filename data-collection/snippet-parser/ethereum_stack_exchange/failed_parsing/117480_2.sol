pragma solidity ^0.8.5;

import 'Token.sol';
import 'TransferToken.sol';

contract Owner {
   function transfer(address recipient, uint256 amount) external {
       Token token = Token(Token.sol Contract Address);
       token.approve(TransferToken.sol Contract Address, amount);

       TransferToken transferToken =TransferToken(TransferToken.sol Contract Address);
       transferToken.transferFrom(recipient, amount);

   }

}
