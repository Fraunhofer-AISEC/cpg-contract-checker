
pragma solidity ^0.8.16;

contract Contract {

    address public owner = msg.sender;  
    uint public tokens = 10000;           
    mapping(address=>uint) balances;    
    
    balances[owner] = tokens; 
    tokens.push(5); 

    uint256 a = 5; 
    uint256 b = 6; 

    a + b; 

}
