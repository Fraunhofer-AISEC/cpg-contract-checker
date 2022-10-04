pragma solidity ^0.5.8;

import "./ERC223-token-standard-development/token/ERC223/ERC223Burnable.sol";
import "./ERC223-token-standard-development/token/ERC223/ERC223Mintable.sol";

contract MyToken is ERC223Burnable, ERC223Mintable{
}
