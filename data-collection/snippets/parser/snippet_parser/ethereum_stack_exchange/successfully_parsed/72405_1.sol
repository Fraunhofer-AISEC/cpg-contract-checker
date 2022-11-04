pragma solidity ^0.5.8;

import "./StorageContract.sol";

contract UserContract {
    StorageContract storages;
    constructor (address _storageAddress) public {
        storages = StorageContract(_storageAddress);
    }

    function userSetNewUser(address _userId, string memory _userName) public returns(address){
        require(msg.sender != address(0));
        address userId = storages.setNewUser(_userId, _userName);
        return userId;
    }
}
