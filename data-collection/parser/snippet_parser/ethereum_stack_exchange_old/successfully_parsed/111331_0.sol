pragma solidity ^0.6.0;

contract UserCrud{
    struct userStruct{
        uint userAge;
        uint index;
        bytes32 userName;
        bytes32 userEmail;
    }
    mapping(address => userStruct) private userStructs;
    address[] private userIndex;

    function insertUser(
    address userAddress,
    uint userAge,
    bytes32 userName,
    bytes32 userEmail) public returns (uint index) {
        require(!isUser(userAddress));
        userStructs[userAddress].userAge = userAge;
        userStructs[userAddress].userName = userName;
        userStructs[userAddress].userEmail = userEmail;
        userStructs[userAddress].index = userIndex.push(userAddress) - 1; 
}
}