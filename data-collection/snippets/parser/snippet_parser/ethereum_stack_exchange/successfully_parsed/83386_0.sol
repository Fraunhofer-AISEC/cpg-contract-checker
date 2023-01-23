pragma solidity ^0.5.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {}

contract Depository {
    function transferFrom(uint amount) external {
        Token token = Token(0xFab46E002BbF0b4509813474841E0716E6730136);
        token.transferFrom(msg.sender, address(this), amount);
    }
}

contract Owner {
    function transfer(uint amount) external {
        Token token = Token(0xFab46E002BbF0b4509813474841E0716E6730136);
        
        token.approve(0xF5c7313cB994A0F8cEee341dC61C15753F775Fcf, amount);

        
        Depository depository = Depository(0xF5c7313cB994A0F8cEee341dC61C15753F775Fcf);
        depository.transferFrom(amount);

    }
}
