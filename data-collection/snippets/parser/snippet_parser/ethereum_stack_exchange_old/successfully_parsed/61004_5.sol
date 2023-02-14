pragma solidity ^0.5.0;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';

contract FunnyToken is ERC20 {
    string public constant name = "FunnyToken";
    string public constant symbol = "FYT";
    uint8 public constant decimals = 18;
    uint256 public _totalSupply = 10000;
    address private owner;

    constructor() public {
        owner = msg.sender;
    }
}
