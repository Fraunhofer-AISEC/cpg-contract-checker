pragma solidity >=0.4.0 <0.7.0;

contract New{

    mapping(address => string) public users; 

    

    
    

    function updateUser(string memory name) public {
        users[msg.sender] = name; 

    }
    function getUser(address a) public view returns(string memory) {
        return users[a]; 
    }
}
