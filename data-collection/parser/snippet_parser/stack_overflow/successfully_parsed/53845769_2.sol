pragma solidity 0.5.2;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract TokenMock is ERC20
{
    constructor () public {
        _mint(msg.sender, 1000000);
    }
}
