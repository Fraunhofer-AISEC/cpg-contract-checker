pragma solidity ^0.4.24;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";


contract FunnyToken is ERC20 {
    string public constant name = "FunnyToken";
    string public constant symbol = "FYT";
    uint8 public constant decimals = 18;
    uint256 private _totalSupply = 10000 * (10 ** uint256(decimals));
    address private owner;

    constructor() public {
        owner = msg.sender;
    }
}
