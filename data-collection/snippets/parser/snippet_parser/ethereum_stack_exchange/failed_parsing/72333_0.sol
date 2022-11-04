pragma solidity >=0.4.0 <0.7.0;

contract NewHello{

    mapping(address => string) public users; 

    function updateUser(string memory name) public {
        if(string name != users[name]){
            users[msg.sender] = name; 
        }

    }
    function getUser(address userAddress) public view returns(string memory) {
        return users[userAddress]; 
    }
}
