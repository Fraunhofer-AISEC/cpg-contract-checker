pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';


contract LeonardianToken is MintableToken {

    uint256 public constant INITIAL_SUPPLY = 10000;


    string public constant name = "Leonardian"; 
    string public constant symbol = "LEON"; 
    uint8 public constant decimals = 18; 
}
