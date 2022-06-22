pragma solidity ^0.6.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor(string memory _name, string memory _symbol)
        public
        ERC20(_name, _symbol)
    {
        _mint(msg.sender, 10000000000000000000000000000);
    }
}
