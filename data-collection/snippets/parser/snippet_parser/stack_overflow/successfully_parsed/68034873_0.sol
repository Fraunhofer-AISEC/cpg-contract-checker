pragma solidity ^0.8.5;

contract MyContract {
    mapping (string => bool) isRegistered;
    
    function register(string memory _email) external {
        require(!isRegistered[_email], 'This e-mail is already registered');
        
        
        
        isRegistered[_email] = true; 
    }
}
