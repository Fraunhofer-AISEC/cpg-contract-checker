pragma solidity ^0.5.0;

contract Marketplace {
    string public name;
    address owner;
    uint public fileCount = 0;
    mapping(uint => File) public files; 


    struct File
    {
        uint id;
        string name;
        address owner;
        address sharedWith;
    }

    event FileViewed(
        uint id,
        string name,
        address owner,
        address sharedWith
    );

    constructor() public {
        name = "File Sharing System";
        owner = msg.sender;
    }

    function viewFile(uint _id) public 
    {
        File memory _file = files[_id];
        require(msg.sender==_file.sharedWith || msg.sender==owner ,"Not shared with you!!");
        emit FileViewed(fileCount, _file.name, owner, _file.sharedWith);
    }
}

