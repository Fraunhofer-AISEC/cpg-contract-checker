pragma solidity ^0.4.17;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/v1.6.0/contracts/token/ERC20/StandardToken.sol";

contract MyToken is StandardToken {
    string public name = "MyTok";
    string public symbol = "MTK";
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLY = 5000;

    event Transfer(address s, address s2, uint amount);

    function MyToken () public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        Transfer(0x0,msg.sender,totalSupply_); 
    }
}
