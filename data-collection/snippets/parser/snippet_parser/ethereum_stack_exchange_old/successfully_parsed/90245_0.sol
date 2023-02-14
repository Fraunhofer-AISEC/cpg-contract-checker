pragma solidity 0.6.0;

contract LoopingThroughArray {
    
    struct User {
        uint256 exampleValue;
        address id;
        
    }
    
    User[] public users;
    
    receive() external payable {
        for (uint i=0; i<=users.length; i++) {
            User[i].exampleValue = User[i] + 5;  
        }  
    }
    
    
} 
