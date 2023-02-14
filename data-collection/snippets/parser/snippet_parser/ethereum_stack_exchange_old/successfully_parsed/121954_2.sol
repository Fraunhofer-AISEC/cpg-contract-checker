pragma solidity >=0.8.7;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract Token is ERC20 {
    constructor(string memory name, string memory symbol , uint256 supply) ERC20(name, symbol) {
            _mint(msg.sender,supply * 10 ** decimals())
}
}

