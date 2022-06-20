pragma solidity ^0.5.0;

contract Marketplace {
    uint public notificationCount = 0;
    mapping(uint => FileChanges) public modifications;
    struct FileChanges
    {
        string name;
        address madeBy;
        string changesMade;
        string timeStamp;
    }
    function updateModifications(string memory _name, string memory _message, string memory _date) onlyOwner public payable
    {
        notificationCount++;
        modifications[notificationCount] = FileChanges(_name, msg.sender, "Contract created", _date);
    }
}
