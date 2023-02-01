
pragma solidity ^0.8.7;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract ExampleToken is ERC20 {

    address public owner;

    constructor() ERC20('ExampleToken', 'EXM') {
        _mint(msg.sender, 1000000 * 10**18);
        owner = msg.sender;
    }
}
