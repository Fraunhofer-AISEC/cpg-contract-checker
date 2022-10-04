pragma solidity >=0.4.0 <0.7.0;

contract NewHello {

    mapping(address => string) public users; 

    function updateUser(string memory name) public {
        require(bytes(users[msg.sender]).length == 0);
        users[msg.sender] = name; 
    }

    function getUser(address userAddress) public view returns(string memory) {
        return users[userAddress]; 
    }
}
