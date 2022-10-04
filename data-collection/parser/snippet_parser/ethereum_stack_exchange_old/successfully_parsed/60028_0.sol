pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract MyToken is StandardToken{

    string public name = "MyToken";
    string public symbol = "MYT";
    uint8 public decimals = 10;
    uint public INITIAL_SUPPLY = 100000000000000000;

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }

}
