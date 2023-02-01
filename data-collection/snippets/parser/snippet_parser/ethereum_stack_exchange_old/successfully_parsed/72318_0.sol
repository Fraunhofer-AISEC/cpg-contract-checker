pragma solidity >=0.4.0 <0.7.0;

contract New{

    mapping(address => string) public users;

    string name;

    address[] public userAddress ;
    

    function updateUser(string memory name) public{
        users[msg.sender]= name;

    }
    function getUser(address[] calldata) external view returns(string memory){
        return users.name;
    }

}
