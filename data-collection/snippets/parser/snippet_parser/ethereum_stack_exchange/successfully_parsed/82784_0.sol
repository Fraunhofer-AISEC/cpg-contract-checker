pragma solidity >=0.4.21 <0.7.0;

import "./StandardToken.sol";
import "./Owned.sol";

contract Konserta is StandardToken, Owned {
    string public name; 
    string public symbol;    
    uint256 public tokenprice; 
    string public version = "v0.1";
    uint8 public constant decimals = 8; 
    uint256 public constant INITIAL_SUPPLY = 700 * (10 ** uint256(decimals));

    constructor() public  {
        name = "Token 1";                     
        totSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;         
        emit Transfer(address(0),msg.sender,INITIAL_SUPPLY);
        symbol = "TKN"; 
    }

    function getBalanceContract() view public returns(uint256) {
        return address(this).balance;
    }
}
