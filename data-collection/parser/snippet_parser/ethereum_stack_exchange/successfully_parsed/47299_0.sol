pragma Solidity 0.4.23;

contract storeData{
    address public admin;
    mapping(uint256 => bytes32) public userData;

    constructor(){
        admin = msg.sender;
    }

    function saveData(uint256 userId,bytes32 fileHash) returns (bool){
        userData[userId] = fileHash;
        return True
    }

    function getData(uint256 userId) returns (bytes32){
        return userData[userId]
    }

}
