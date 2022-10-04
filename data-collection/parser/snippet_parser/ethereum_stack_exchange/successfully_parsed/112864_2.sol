pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract sampleToken is ERC20 
{
string public name = "ExampleToken";
string public symbol = "EGT";
uint public decimals = 18;
uint public INITIAL_SUPPLY = 10000 * (10 ** decimals);
constructor() public 
    _mint(msg.sender, INITIAL_SUPPLY);
}
