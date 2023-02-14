pragma solidity ^0.8.0;
import 'Token.sol';

contract TransferToken{
    function transferFrom(address recipient, uint amount) external {
        Token token = Token(0xd9145CCE52D386f254917e481eB44e9943F3555);
        token.transferFrom(msg.sender, recipient, amount);
    }
}

contract Owner {
    function transfer(address recipient, uint amount) external {
        Token token = Token(0xd9145CCE52D386f254917e481eB44e9943F39138);
        token.approve(0x617F2E2fD72FD9D5503197092aC168c91465E7f2, amount);
    
        TransferToken transferToken = TransferToken(0x617F2E2fD72FD9D5503197092aC168c91465E7f2);
        transferToken.transferFrom(recipient, amount);
    }
}
