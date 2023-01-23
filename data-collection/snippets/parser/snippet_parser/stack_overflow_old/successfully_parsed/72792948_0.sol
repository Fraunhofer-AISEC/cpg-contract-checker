
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Artytoken is ERC20 {

    address public admin;
    uint private _totalSupply;

    constructor() ERC20('ArtyToken', 'AATK') {
        admin = msg.sender;
        _totalSupply = 1000000;
        _mint(admin, _totalSupply);
    }
}
