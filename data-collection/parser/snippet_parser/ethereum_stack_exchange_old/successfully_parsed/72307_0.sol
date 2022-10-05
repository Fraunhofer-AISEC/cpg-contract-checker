pragma solidity >=0.4.0 <0.7.0;

contract InsanFactory{

    struct User{
         string name;
         address myaddress;
    }

    mapping(address => User) public userStructs;

    address[] public userAddress ;

    function createUser(string memory name,address myaddress) public{
        userStructs[msg.sender] = name;
        
        userStructs[msg.sender] = myaddress;
        
        userAddress.push(msg.sender);

    }
    function getResult() external view returns(address[] memory){
        return userAddress;
    }
}
