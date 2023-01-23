
pragma solidity ^0.8.0;

import "token.sol";

contract TransferToken {
    function transfer() external {
        Token token = Token("sample address here");
        token.transfer(msg.sender, 5);
    }  

    function transferfrom(address recipient, uint amount) external {
        Token token = Token("sample address here");
        token.transferfrom(msg.sender, recipient, amount);
    }

}

contract Owner {
    function transfer(address recipient, uint amount) external {
        Token token = Token("sample address here");
        token.approve("sample address here", amount);

        TransferToken transfertoken = TransferToken("sample address here");
        transfertoken.transfertokenfrom(recipient, amount);
    }
}

The Error:
