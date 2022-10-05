pragma solidity ^0.4.24;

import "node_modules/openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract SToken is MintableToken {
    string public constant name = "SS Token";
    string public constant symbol = "SKS";
    uint8 public constant decimals = 2;
}
