pragma solidity >=0.8.7;

import './6_Token.sol';

contract TransferToken {

  function transfer() external {
    Token token = Token(msg.sender);
    token.transfer(0x617F2E2fD72FD9D5503197092aC168c91465E7f2, 1 ether);
  }  
}
