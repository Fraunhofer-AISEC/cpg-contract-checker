pragma solidity >=0.4.0 <0.7.0;

contract NewHello {

    mapping(address => string) public users; 

    function updateUser(string memory name) public {
        require(keccak256(abi.encodePacked(name)) != keccak256(abi.encodePacked(users[msg.sender])));
        users[msg.sender] = name; 
    }

    function getUser(address userAddress) public view returns(string memory) {
        return users[userAddress]; 
    }
}
